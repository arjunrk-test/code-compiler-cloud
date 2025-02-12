FROM php:cli

# Set working directory
WORKDIR /usr/src/app

# Copy the execution script
COPY execute.sh /usr/src/app/execute.sh

# Give execute permissions
RUN chmod +x /usr/src/app/execute.sh

# Set the entrypoint
ENTRYPOINT ["/usr/src/app/execute.sh"]
