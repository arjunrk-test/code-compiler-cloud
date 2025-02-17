#!/bin/bash

# Create a Javascript file inside the container 
echo -e "$CODE" | base64 --decode > /usr/src/app/script.js

# Create input file inside the container (only if input is provided)
if [ ! -z "$INPUT" ]; then
    echo -e "$INPUT" | base64 --decode > /usr/src/app/input.txt
fi

# Check if the JavaScript code file exists
if [ ! -f "/usr/src/app/script.js" ]; then
  echo "No JavaScript code found!"
  exit 1
fi

# Run JavaScript code and capture errors
if [ -f "/usr/src/app/input.txt" ]; then
    node /usr/src/app/script.js < /usr/src/app/input.txt 2>&1 | tee runtime_error.txt
else
    node /usr/src/app/script.js 2>&1 | tee runtime_error.txt
fi

# Exit with error if there was a failure
if [ $? -ne 0 ]; then
  cat runtime_error.txt
  exit 1
fi
