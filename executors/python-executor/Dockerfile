# Use Python base image
FROM python:3.11

# Set working directory
WORKDIR /usr/src/app

# Copy the execution script
COPY execute.sh /usr/src/app/execute.sh

# Install dependencies
RUN chmod +x /usr/src/app/execute.sh

# Set entrypoint
ENTRYPOINT ["/usr/src/app/execute.sh"]
