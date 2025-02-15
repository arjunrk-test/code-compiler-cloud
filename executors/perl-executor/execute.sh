#!/bin/bash

# Check if the Perl script exists
if [ ! -f "/usr/src/app/script.pl" ]; then
  echo "No Perl script found!"
  exit 1
fi

# Run Perl script and capture errors
perl /usr/src/app/script.pl 2>&1 | tee runtime_error.txt
if [ $? -ne 0 ]; then
  cat runtime_error.txt  # Print errors directly
  exit 1
fi
