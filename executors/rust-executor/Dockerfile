# Use Rust base image
FROM rust:latest

# Set working directory
WORKDIR /usr/src/app

# Copy the execution script
COPY execute.sh /usr/src/app/execute.sh

# Give execute.sh permission to run
RUN chmod +x /usr/src/app/execute.sh

# Set entrypoint
ENTRYPOINT ["/usr/src/app/execute.sh"]
