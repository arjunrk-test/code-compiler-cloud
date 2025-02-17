#!/bin/bash

# Check if Java code exists
if [ ! -f "/usr/src/app/Main.java" ]; then
  echo "No Java code found!"
  exit 1
fi

# Compile Java code
javac Main.java 2>&1 | tee error.txt
if [ $? -ne 0 ]; then
  cat error.txt
  exit 1
fi

# Run Java program with input redirection if input.txt exists
if [ -f "/usr/src/app/input.txt" ]; then
  java Main < /usr/src/app/input.txt 2>&1 | tee runtime_error.txt
else
  java Main 2>&1 | tee runtime_error.txt
fi

if [ $? -ne 0 ]; then
  cat runtime_error.txt
  exit 1
fi
