# Use an official OpenJDK runtime as the base image
FROM openjdk:17-slim

# Set the working directory inside the container
WORKDIR /home/app

# Copy the script that will compile and execute Java code
COPY run.sh /home/app/run.sh

# Give execute permissions to the script
RUN chmod +x /home/app/run.sh

# Default command to execute the script
CMD ["/home/app/run.sh"]
