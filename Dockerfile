# Start with a base image containing Java runtime
FROM adoptopenjdk/openjdk11
# Create work folder
RUN mkdir /work

# Make port 8102 available to the world outside this container
EXPOSE 8082

# Copying the application's jar file inside the container
COPY /tmp/target/*.jar target/springboot2-postgresql-jpa-hibernate-crud-example-0.0.1-SNAPSHOT.jar

HEALTHCHECK --interval=1m --timeout=3s CMD wget -q -T 3 -s http://localhost:8082/actuator/health/ || exit 1
