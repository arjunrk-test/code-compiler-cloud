#!/bin/bash

# Check if the Typescript code file exists
if [ ! -f "/usr/src/app/script.ts" ]; then
  echo "No Typescript code found!"
  exit 1
fi

# Run Typescript code and capture errors
node --no-warnings script.ts 2>&1 | tee runtime_error.txt
# Exit with error if there was a failure
if [ $? -ne 0 ]; then
  cat runtime_error.txt
  exit 1
fi
