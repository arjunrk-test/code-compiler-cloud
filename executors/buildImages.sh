#!/bin/bash

# List of all executors
executors=("bash" "c" "cpp" "csharp" "java" "javascript" "kotlin" "perl" "php" "python" "ruby" "rust" "swift" "typescript")

# Create a log file for failed builds
failed_builds=()

# Loop through each executor and build the Docker image
for executor in "${executors[@]}"; do
  echo "Building $executor-executor..."
  cd "$executor-executor" || { echo "Failed to enter $executor-executor directory"; failed_builds+=("$executor-executor"); continue; }
  
  # Build image and check if it succeeds
  if ! docker build -t "$executor-executor" .; then
    echo "Failed to build $executor-executor"
    failed_builds+=("$executor-executor")
  fi

  cd ..
done

# Show summary
echo "============================="
echo "Build process completed!"
if [ ${#failed_builds[@]} -eq 0 ]; then
  echo "✅ All images built successfully!"
else
  echo "❌ The following images failed to build:"
  for failed in "${failed_builds[@]}"; do
    echo "- $failed"
  done
fi
echo "============================="
