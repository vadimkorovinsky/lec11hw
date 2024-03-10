# Use a minimal image as parent
FROM openjdk:8-jdk-alpine
# Copy war to tomcat folder
ADD target/wwp-1.0.0.war /usr/local/tomcat/webapps