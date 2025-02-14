# Use Swift official image
FROM swift:latest

# Set working directory
WORKDIR /home/app

# Copy the execution script
COPY execute.sh /home/app/execute.sh

# Give execute.sh permission to run
RUN chmod +x /home/app/execute.sh

# Set entrypoint
ENTRYPOINT ["/home/app/execute.sh"]
