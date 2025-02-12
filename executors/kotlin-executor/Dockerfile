# Use a Debian-based OpenJDK image
FROM openjdk:11-slim

# Set working directory inside the container
WORKDIR /usr/src/app

# Install required dependencies (curl, zip, unzip)
RUN apt-get update && apt-get install -y curl unzip zip && \
    curl -s "https://get.sdkman.io" | bash && \
    bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && sdk install kotlin" && \
    ln -s $HOME/.sdkman/candidates/kotlin/current/bin/kotlinc /usr/local/bin/kotlinc && \
    ln -s $HOME/.sdkman/candidates/kotlin/current/bin/kotlin /usr/local/bin/kotlin && \
    rm -rf /var/lib/apt/lists/*


# Copy script to container
COPY execute.sh /usr/src/app/execute.sh

# Ensure execute.sh has Unix-style line endings and is executable
RUN chmod +x /usr/src/app/execute.sh

# Set entrypoint
ENTRYPOINT ["/usr/src/app/execute.sh"]
