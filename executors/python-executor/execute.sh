#!/bin/bash

# Create a Python file inside the container 
echo -e "$CODE" | base64 --decode > /usr/src/app/script.py

# Create input file inside the container (only if input is provided)
if [ ! -z "$INPUT" ]; then
    echo -e "$INPUT" | base64 --decode > /usr/src/app/input.txt
fi

# Check if the Python code file exists
if [ ! -f "/usr/src/app/script.py" ]; then
  echo "No Python code found!"
  exit 1
fi

# Run Python script and capture errors
if [ -f "/usr/src/app/input.txt" ]; then
    python3 script.py < /usr/src/app/input.txt 2>&1 | tee runtime_error.txt
else
    python3 script.py 2>&1 | tee runtime_error.txt
fi

if [ $? -ne 0 ]; then
  cat runtime_error.txt  # Print errors directly
  exit 1
fi
