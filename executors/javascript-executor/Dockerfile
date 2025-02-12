# Use Node.js as the base image
FROM node:latest

# Set working directory
WORKDIR /usr/src/app

# Copy the execution script
COPY execute.sh .

# Give execute permissions to the script
RUN chmod +x execute.sh

# Set entrypoint
ENTRYPOINT ["/usr/src/app/execute.sh"]
