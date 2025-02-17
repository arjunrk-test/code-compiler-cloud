#!/bin/bash

# Create a PHP file inside the container 
echo -e "$CODE" | base64 --decode > /usr/src/app/script.php

# Create input file inside the container (only if input is provided)
if [ ! -z "$INPUT" ]; then
    echo -e "$INPUT" | base64 --decode > /usr/src/app/input.txt
fi

# Check if the PHP script exists
if [ ! -f "/usr/src/app/script.php" ]; then
  echo "No PHP script found!"
  exit 1
fi

# Run PHP script and capture errors
if [ -f "/usr/src/app/input.txt" ]; then
    php /usr/src/app/script.php < /usr/src/app/input.txt 2>&1 | tee runtime_error.txt
else
    php /usr/src/app/script.php 2>&1 | tee runtime_error.txt
fi

if [ $? -ne 0 ]; then
  cat runtime_error.txt  # Print errors directly
  exit 1
fi
