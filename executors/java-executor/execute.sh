#!/bin/bash

# Check if the Java code file exists
if [ ! -f "/home/app/Main.java" ]; then
  echo "No Java code found!"
  exit 1
fi

# Compile Java code and capture errors
javac Main.java 2>&1 | tee error.txt
if [ $? -ne 0 ]; then
  cat error.txt  # Print errors directly
  exit 1
fi

# Run Java program and capture runtime errors
java Main 2>&1 | tee runtime_error.txt
if [ $? -ne 0 ]; then
  cat runtime_error.txt  # Print runtime errors directly
  exit 1
fi
