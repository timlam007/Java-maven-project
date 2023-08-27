# Use a base image with a Java Runtime Environment (JRE)
FROM registry.redhat.io/openjdk/openjdk-11-rhel8

# Set the working directory inside the container
WORKDIR /app

# Copy the built JAR file into the container
COPY  /target/my-maven-docker-project.jar .
# Expose the application port (if needed)
EXPOSE 8080

# Command to run the application when the container starts
CMD ["java", "-jar", "my-maven-docker-project.jar"]
