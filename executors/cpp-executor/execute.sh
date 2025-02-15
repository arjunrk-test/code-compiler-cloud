#!/bin/bash

# Check if the C++ source file exists
if [ ! -f "/usr/src/app/main.cpp" ]; then
  echo "No C++ code found!"
  exit 1
fi

# Compile the C++ code
g++ /usr/src/app/main.cpp -o /usr/src/app/main.out 2> compile_error.txt
if [ $? -ne 0 ]; then
  cat compile_error.txt  # Print compilation errors
  exit 1
fi

# Run the compiled program and capture runtime errors
/usr/src/app/main.out 2> runtime_error.txt
if [ $? -ne 0 ]; then
  cat runtime_error.txt  # Print runtime errors
  exit 1
fi
