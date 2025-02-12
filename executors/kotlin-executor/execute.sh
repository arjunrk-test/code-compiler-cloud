#!/bin/sh

# Ensure the script stops on error
set -e

# Check if the source file exists
if [ ! -f "Main.kt" ]; then
    echo "Error: Main.kt not found!"
    exit 1
fi

# Compile Kotlin code to a JAR file with a manifest specifying the entry point
kotlinc Main.kt -include-runtime -d Main.jar || { echo "Compilation failed"; exit 1; }

# Run the JAR file
java -jar Main.jar
