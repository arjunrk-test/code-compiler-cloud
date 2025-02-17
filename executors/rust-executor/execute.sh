#!/bin/bash

# Create a Rust file inside the container 
echo -e "$CODE" | base64 --decode > /usr/src/app/main.rs

# Create input file inside the container (only if input is provided)
if [ ! -z "$INPUT" ]; then
    echo -e "$INPUT" | base64 --decode > /usr/src/app/input.txt
fi

# Check if the Rust source file exists
if [ ! -f "/usr/src/app/main.rs" ]; then
  echo "No Rust code found!"
  exit 1
fi

# Compile the Rust code
rustc /usr/src/app/main.rs -o /usr/src/app/main 2> compile_error.txt
if [ $? -ne 0 ]; then
  cat compile_error.txt  # Print compilation errors
  exit 1
fi

# Run the compiled executable and capture runtime errors
if [ -f "/usr/src/app/input.txt" ]; then
    /usr/src/app/main < /usr/src/app/input.txt 2>&1 | tee runtime_error.txt
else
    /usr/src/app/main 2>&1 | tee runtime_error.txt
fi

if [ $? -ne 0 ]; then
  cat runtime_error.txt  # Print runtime errors
  exit 1
fi
