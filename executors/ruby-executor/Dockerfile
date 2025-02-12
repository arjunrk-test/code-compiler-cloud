# Use Ruby base image
FROM ruby:3.2

# Set working directory
WORKDIR /usr/src/app

# Copy the execution script
COPY execute.sh /usr/src/app/execute.sh

# Give execute.sh permission to run
RUN chmod +x /usr/src/app/execute.sh

# Set entrypoint
ENTRYPOINT ["/usr/src/app/execute.sh"]
