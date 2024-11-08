# Step 1: Use Maven image to build the app
FROM maven:3.9.9-openjdk-17-slim AS build

# Step 2: Set the working directory in the container
WORKDIR /app

# Step 3: Copy the pom.xml and source code into the container
COPY pom.xml ./
COPY src ./src

# Step 4: Run Maven to clean, validate, and package the app
# Use the full path to mvn if necessary
RUN /usr/local/bin/mvn clean validate compile package

# Step 5: Optional: Copy the packaged .jar file (if your app is packaged as a jar)
COPY target/calculator.jar /app/calculator.jar

# Step 6: Set the command to run the app (if it's a simple Java app and not a web app)
CMD ["java", "-jar", "/app/calculator.jar"]

