#!/bin/bash

# Create a Swift file inside the container 
echo -e "$CODE" | base64 --decode > /usr/src/app/main.swift

# Create input file inside the container (only if input is provided)
if [ ! -z "$INPUT" ]; then
    echo -e "$INPUT" | base64 --decode > /usr/src/app/input.txt
fi

# Check if the Swift file exists
if [ ! -f "/usr/src/app/main.swift" ]; then
  echo "No Swift code found!"
  exit 1
fi

# Compile and execute the Swift code, capturing errors
if [ -f "/usr/src/app/input.txt" ]; then
    swift /usr/src/app/main.swift < /usr/src/app/input.txt 2>&1 | tee runtime_error.txt
else
    swift /usr/src/app/main.swift 2>&1 | tee runtime_error.txt
fi

if [ $? -ne 0 ]; then
  cat runtime_error.txt  # Print errors directly
  exit 1
fi
