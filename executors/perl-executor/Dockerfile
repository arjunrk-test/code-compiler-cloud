# Use the official Perl image
FROM perl:latest

# Set working directory
WORKDIR /usr/src/app

# Copy script and execution file
COPY execute.sh /usr/src/app/
# COPY Main.pl /usr/src/app/

# Install dos2unix for script formatting
RUN apt-get update && apt-get install -y dos2unix && \
    dos2unix /usr/src/app/execute.sh && chmod +x /usr/src/app/execute.sh

# Set execute.sh as the entrypoint
ENTRYPOINT ["/usr/src/app/execute.sh"]
