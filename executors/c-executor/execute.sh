#!/bin/bash

# Check if the C file exists
if [ ! -f "/usr/src/app/main.c" ]; then
  echo "No C code found!"
  exit 1
fi

# Compile the C program
gcc /usr/src/app/main.c -o /usr/src/app/main 2> compile_error.txt
if [ $? -ne 0 ]; then
  cat compile_error.txt  # Output compilation errors
  exit 1
fi

# Execute the compiled program
/usr/src/app/main 2> runtime_error.txt
if [ $? -ne 0 ]; then
  cat runtime_error.txt  # Output runtime errors
  exit 1
fi
