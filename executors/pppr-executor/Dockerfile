# Use lightweight Alpine base image
FROM alpine:latest

# Set working directory
WORKDIR /usr/src/app

# Install necessary packages using apk
RUN apk add --no-cache \
    bash \
    curl \
    python3 \
    py3-pip \
    perl \
    php \
    ruby

# Copy execution script
COPY execute.sh /usr/src/app/execute.sh

# Give execution permissions
RUN chmod +x /usr/src/app/execute.sh

# Default command to execute the script
CMD ["/usr/src/app/execute.sh"]
