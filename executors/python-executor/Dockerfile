# Use Python base image
FROM python:3.11

# Set working directory
WORKDIR /home/app

# Copy the execution script
COPY execute.sh /home/app/execute.sh

# Install dependencies
RUN chmod +x /home/app/execute.sh

# Set entrypoint
ENTRYPOINT ["/home/app/execute.sh"]
