#!/bin/bash

# Create a Typescript file inside the container 
echo -e "$CODE" | base64 --decode > /usr/src/app/script.ts

# Create input file inside the container (only if input is provided)
if [ ! -z "$INPUT" ]; then
    echo -e "$INPUT" | base64 --decode > /usr/src/app/input.txt
fi

# Check if the Typescript code file exists
if [ ! -f "/usr/src/app/script.ts" ]; then
  echo "No Typescript code found!"
  exit 1
fi

# Run Typescript code and capture errors
if [ -f "/usr/src/app/input.txt" ]; then
    node --no-warnings script.ts < /usr/src/app/input.txt 2>&1 | tee runtime_error.txt
else
    node --no-warnings script.ts 2>&1 | tee runtime_error.txt
fi

# Exit with error if there was a failure
if [ $? -ne 0 ]; then
  cat runtime_error.txt
  exit 1
fi
