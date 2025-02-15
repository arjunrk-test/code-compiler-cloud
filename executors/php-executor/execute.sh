#!/bin/bash

# Check if the PHP script exists
if [ ! -f "/usr/src/app/script.php" ]; then
  echo "No PHP script found!"
  exit 1
fi

# Run PHP script and capture errors
php /usr/src/app/script.php 2>&1 | tee runtime_error.txt
if [ $? -ne 0 ]; then
  cat runtime_error.txt  # Print errors directly
  exit 1
fi
