#!/bin/bash

# Check if the C# source file exists
if [ ! -f "/usr/src/app/Test.cs" ]; then
  echo "No C# code found!"
  exit 1
fi

# Compile the C# code
mcs /usr/src/app/Test.cs -out:/usr/src/app/Test.exe 2> compile_error.txt
if [ $? -ne 0 ]; then
  cat compile_error.txt  # Print compilation errors
  exit 1
fi

# Run the compiled test and capture runtime errors
mono /usr/src/app/Test.exe 2> runtime_error.txt
if [ $? -ne 0 ]; then
  cat runtime_error.txt  # Print runtime errors
  exit 1
fi
