#!/bin/bash

# Create a Kotlin file inside the container 
echo -e "$CODE" | base64 --decode > /usr/src/app/Main.kt

# Create input file inside the container (only if input is provided)
if [ ! -z "$INPUT" ]; then
    echo -e "$INPUT" | base64 --decode > /usr/src/app/input.txt
fi

# Check if the Kotlin source file exists
if [ ! -f "/usr/src/app/Main.kt" ]; then
  echo "No Kotlin code found!"
  exit 1
fi

# Compile the Kotlin code
kotlinc Main.kt -include-runtime -d Main.jar 2> error.txt
if [ $? -ne 0 ]; then
  cat error.txt  # Print compilation errors
  exit 1
fi

# Run the compiled Kotlin program
if [ -f "/usr/src/app/input.txt" ]; then
    java -jar Main.jar < /usr/src/app/input.txt 2>&1 | tee runtime_error.txt
else
    java -jar Main.jar 2>&1 | tee runtime_error.txt
fi

if [ $? -ne 0 ]; then
  cat runtime_error.txt  # Print runtime errors
  exit 1
fi
