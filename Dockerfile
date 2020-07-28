FROM maven:3.5.2-jdk-8-alpine AS MAVEN_TOOL_CHAIN
RUN mkdir /work

FROM java:8-jre-alpine

EXPOSE 8082

RUN mkdir /app
COPY --from=MAVEN_TOOL_CHAIN /tmp/target/*.jar /app/springboot2-postgresql-jpa-hibernate-crud-example-0.0.1-SNAPSHOT.jar

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app/springboot2-postgresql-jpa-hibernate-crud-example-0.0.1-SNAPSHOT.jar"]

HEALTHCHECK --interval=1m --timeout=3s CMD wget -q -T 3 -s http://localhost:8082/actuator/health/ || exit 1
