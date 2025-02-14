# Use Node.js official image
FROM node:latest

# Set working directory
WORKDIR /usr/src/app

# Install TypeScript
RUN npm install -g typescript

# Copy the execution script
COPY execute.sh /usr/src/app/execute.sh

# Give execute.sh permission to run
RUN chmod +x /usr/src/app/execute.sh

# Set entrypoint
ENTRYPOINT ["/usr/src/app/execute.sh"]
