#!/bin/bash

# Create a C# file inside the container 
echo -e "$CODE" | base64 --decode > /usr/src/app/Test.cs

# Create input file inside the container (only if input is provided)
if [ ! -z "$INPUT" ]; then
    echo -e "$INPUT" | base64 --decode > /usr/src/app/input.txt
fi

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
if [ -f "/usr/src/app/input.txt" ]; then
    mono /usr/src/app/Test.exe < /usr/src/app/input.txt 2>&1 | tee runtime_error.txt
else
    mono /usr/src/app/Test.exe 2>&1 | tee runtime_error.txt
fi

if [ $? -ne 0 ]; then
  cat runtime_error.txt  # Print runtime errors
  exit 1
fi
