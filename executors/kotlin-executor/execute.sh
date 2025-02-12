#!/bin/sh

# Ensure the script stops on error
set -e
echo "$CODE" > Main.kt

# Compile Kotlin code to a JAR file with a manifest specifying the entry point
kotlinc Main.kt -include-runtime -d Main.jar || { echo "Compilation failed"; exit 1; }

# Run the JAR file
java -jar Main.jar
