#!/bin/bash

# Check if the Python code file exists
if [ ! -f "/home/app/script.py" ]; then
  echo "No Python code found!"
  exit 1
fi

# Run Python script and capture errors
python3 script.py 2>&1 | tee runtime_error.txt
if [ $? -ne 0 ]; then
  cat runtime_error.txt  # Print errors directly
  exit 1
fi
