#!/bin/bash

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
/usr/src/app/main 2> runtime_error.txt
if [ $? -ne 0 ]; then
  cat runtime_error.txt  # Print runtime errors
  exit 1
fi
