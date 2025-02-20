# Use the official Alpine base image
FROM alpine:latest

# Install necessary packages and Node.js
RUN apk add --no-cache \
            nodejs \
            npm \
            bash \
            python3 \
            py3-pip \
            perl \
            php \
            ruby \
            gcc \
            g++

# Set the working directory inside the container
WORKDIR /usr/src/app

# Install TypeScript
RUN npm install -g typescript ts-node

# Copy the execution script
COPY execute.sh /usr/src/app/execute.sh

# Give execute.sh permission to run
RUN chmod +x /usr/src/app/execute.sh

# Set entrypoint
ENTRYPOINT ["/usr/src/app/execute.sh"]
