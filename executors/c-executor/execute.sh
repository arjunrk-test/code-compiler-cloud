#!/bin/bash

# Create C file inside the container
echo -e "$CODE" | base64 --decode > /usr/src/app/main.c

# Create input file inside the container (only if input is provided)
if [ ! -z "$INPUT" ]; then
    echo -e "$INPUT" | base64 --decode > /usr/src/app/input.txt
fi

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

# Run C program with or without input redirection
if [ -f "/usr/src/app/input.txt" ]; then
    /usr/src/app/main < /usr/src/app/input.txt 2>&1 | tee runtime_error.txt
else
    /usr/src/app/main 2>&1 | tee runtime_error.txt
fi

if [ $? -ne 0 ]; then
    cat runtime_error.txt
    exit 1
fi