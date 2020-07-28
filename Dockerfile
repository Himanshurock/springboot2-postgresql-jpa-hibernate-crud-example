# Start with a base image containing Java runtime
FROM adoptopenjdk/openjdk11
# Create work folder
RUN mkdir /work

# Make port 8102 available to the world outside this container
EXPOSE 8082

# Copying the application's jar file inside the container
COPY target/springboot2-postgresql-jpa-hibernate-crud-example-0.0.1-SNAPSHOT.jar
