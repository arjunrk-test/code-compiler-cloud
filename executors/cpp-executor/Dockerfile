# Use a minimal Alpine-based C++ image
FROM gcc:latest

# Set working directory
WORKDIR /usr/src/app

# Copy the execution script
COPY execute.sh .

# Give execute permissions to the script
RUN chmod +x execute.sh

# Set entrypoint
ENTRYPOINT ["/usr/src/app/execute.sh"]
