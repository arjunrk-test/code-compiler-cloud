#!/bin/bash

# Check if the Ruby script exists
if [ ! -f "/usr/src/app/script.rb" ]; then
  echo "No Ruby script found!"
  exit 1
fi

# Run Ruby script and capture errors
ruby /usr/src/app/script.rb 2>&1 | tee runtime_error.txt
if [ $? -ne 0 ]; then
  cat runtime_error.txt  # Print errors directly
  exit 1
fi
