#!/bin/bash

# Map the language to its corresponding filename
declare -A file_map=(
    ["c"]="main.c"
    ["cpp"]="main.cpp"
    ["perl"]="script.pl"
    ["php"]="script.php"
    ["python"]="script.py"
    ["ruby"]="script.rb"
    ["javascript"]="script.js"
    ["typescript"]="script.ts"
)

# Check if the language is provided
if [ -z "$LANGUAGE" ]; then
    echo "No language specified!"
    exit 1
fi

# Get the corresponding filename
FILENAME=${file_map[$LANGUAGE]}

# If the language is not in the map, exit
if [ -z "$FILENAME" ]; then
    echo "Unsupported language: $LANGUAGE"
    exit 1
fi

# Create the source code file inside the container
echo -e "$CODE" | base64 -d > "/usr/src/app/$FILENAME"

# Create input file inside the container (only if input is provided)
if [ ! -z "$INPUT" ]; then
    echo -e "$INPUT" | base64 -d > "/usr/src/app/input.txt"
fi

# Check if the source code file exists
if [ ! -f "/usr/src/app/$FILENAME" ]; then
    echo "No source code found!"
    exit 1
fi

# Compile and execute based on the language
case "$LANGUAGE" in
    "c")
        gcc "/usr/src/app/$FILENAME" -o /usr/src/app/main.out
        if [ ! -f "/usr/src/app/main.out" ]; then
            echo "Compilation failed!"
            exit 1
        fi
        EXEC_CMD="/usr/src/app/main.out"
        ;;
    "cpp")
        g++ "/usr/src/app/$FILENAME" -o /usr/src/app/main.out
        if [ ! -f "/usr/src/app/main.out" ]; then
            echo "Compilation failed!"
            exit 1
        fi
        EXEC_CMD="/usr/src/app/main.out"
        ;;
    "perl")
        EXEC_CMD="perl /usr/src/app/$FILENAME"
        ;;
    "php")
        EXEC_CMD="php /usr/src/app/$FILENAME"
        ;;
    "python")
        EXEC_CMD="python3 /usr/src/app/$FILENAME"
        ;;
    "ruby")
        EXEC_CMD="ruby /usr/src/app/$FILENAME"
        ;;
    "javascript") 
        EXEC_CMD="node --no-warnings /usr/src/app/$FILENAME" 
        ;;
    "typescript") 
        tsc "/usr/src/app/$FILENAME"
        COMPILED_FILE="/usr/src/app/${FILENAME%.ts}.js"
        if [ ! -f "$COMPILED_FILE" ]; then
            echo "Compilation failed!"
            exit 1
        fi
        EXEC_CMD="node $COMPILED_FILE"
        ;;
    *)
        echo "Unknown execution command!"
        exit 1
        ;;
esac

# Run the compiled program, capturing both stdout and stderr
if [ -f "/usr/src/app/input.txt" ]; then
    $EXEC_CMD < /usr/src/app/input.txt 2>&1 | tee runtime_error.txt
else
    $EXEC_CMD 2>&1 | tee runtime_error.txt
fi

# Exit with error if execution failed
if [ $? -ne 0 ]; then
    cat runtime_error.txt
    exit 1
fi
