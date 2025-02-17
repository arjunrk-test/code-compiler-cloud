#!/bin/bash

# Create a Perl file inside the container 
echo -e "$CODE" | base64 --decode > /usr/src/app/script.pl

# Create input file inside the container (only if input is provided)
if [ ! -z "$INPUT" ]; then
    echo -e "$INPUT" | base64 --decode > /usr/src/app/input.txt
fi

# Check if the Perl script exists
if [ ! -f "/usr/src/app/script.pl" ]; then
  echo "No Perl script found!"
  exit 1
fi

# Run Perl script and capture errors
if [ -f "/usr/src/app/input.txt" ]; then
    perl /usr/src/app/script.pl < /usr/src/app/input.txt 2>&1 | tee runtime_error.txt
else
    perl /usr/src/app/script.pl 2>&1 | tee runtime_error.txt
fi

if [ $? -ne 0 ]; then
  cat runtime_error.txt  # Print errors directly
  exit 1
fi
