# Use a minimal .NET runtime
FROM mono:latest

# Set working directory
WORKDIR /usr/src/app

# Install C# compiler
RUN apt-get update && apt-get install -y mono-mcs

# Copy the execution script
COPY execute.sh .

# Give execute permissions to the script
RUN chmod +x execute.sh

# Set entrypoint
ENTRYPOINT ["/usr/src/app/execute.sh"]
