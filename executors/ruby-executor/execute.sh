#!/bin/bash

# Create a Ruby file inside the container 
echo -e "$CODE" | base64 --decode > /usr/src/app/script.rb

# Create input file inside the container (only if input is provided)
if [ ! -z "$INPUT" ]; then
    echo -e "$INPUT" | base64 --decode > /usr/src/app/input.txt
fi

# Check if the Ruby script exists
if [ ! -f "/usr/src/app/script.rb" ]; then
  echo "No Ruby script found!"
  exit 1
fi

# Run Ruby script and capture errors
if [ -f "/usr/src/app/input.txt" ]; then
    ruby /usr/src/app/script.rb < /usr/src/app/input.txt 2>&1 | tee runtime_error.txt
else
    ruby /usr/src/app/script.rb 2>&1 | tee runtime_error.txt
fi

if [ $? -ne 0 ]; then
  cat runtime_error.txt  # Print errors directly
  exit 1
fi
