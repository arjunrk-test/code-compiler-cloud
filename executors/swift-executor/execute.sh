#!/bin/bash

# Check if the Swift file exists
if [ ! -f "/home/app/main.swift" ]; then
  echo "No Swift code found!"
  exit 1
fi

# Compile and execute the Swift code, capturing errors
swift /home/app/main.swift 2>&1 | tee runtime_error.txt
if [ $? -ne 0 ]; then
  cat runtime_error.txt  # Print errors directly
  exit 1
fi
