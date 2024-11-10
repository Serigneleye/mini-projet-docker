FROM amazoncorretto:17-alpine

# Set the working directory
WORKDIR /app

# Copy the backend JAR file into the container
COPY target/paymybuddy.jar /app/paymybuddy.jar

# Expose the application's port
EXPOSE 8080

# Define the command to run the backend service
CMD ["java", "-jar", "/app/paymybuddy.jar"]

