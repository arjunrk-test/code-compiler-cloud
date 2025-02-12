FROM alpine:latest

# Install Bash
RUN apk add --no-cache bash

# Set working directory
WORKDIR /usr/src/app

# Copy the execution script
COPY execute.sh /usr/src/app/execute.sh
RUN chmod +x /usr/src/app/execute.sh

# Set the entrypoint to execute.sh
ENTRYPOINT ["/usr/src/app/execute.sh"]
