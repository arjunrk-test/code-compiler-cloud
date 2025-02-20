# Use Debian slim image
FROM alpine:latest

# Set working directory
WORKDIR /usr/src/app

# Install necessary dependencies
RUN apk add --no-cache \
    bash \
    gcc \
    g++ \
    curl

# Copy execution script
COPY execute.sh /usr/src/app/execute.sh

# Give execution permissions
RUN chmod +x /usr/src/app/execute.sh

# Default command to execute the script
CMD ["/usr/src/app/execute.sh"]
