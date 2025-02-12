#!/bin/bash

# Write the input Java code to a file
echo "$CODE" > Main.java

# Compile the Java program
javac Main.java 2> error.txt
if [ $? -ne 0 ]; then
  cat error.txt
  exit 1
fi

# Run the Java program and capture output
java Main
