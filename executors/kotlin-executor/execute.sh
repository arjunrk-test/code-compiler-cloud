#!/bin/bash

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
java -jar Main.jar 2> runtime_error.txt
if [ $? -ne 0 ]; then
  cat runtime_error.txt  # Print runtime errors
  exit 1
fi
