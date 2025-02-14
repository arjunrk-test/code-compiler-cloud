#!/bin/bash

# Check if the JavaScript code file exists
if [ ! -f "/home/app/script.js" ]; then
  echo "No JavaScript code found!"
  exit 1
fi

# Run JavaScript code and capture errors
node /home/app/script.js 2>&1 | tee runtime_error.txt

# Exit with error if there was a failure
if [ $? -ne 0 ]; then
  cat runtime_error.txt
  exit 1
fi
