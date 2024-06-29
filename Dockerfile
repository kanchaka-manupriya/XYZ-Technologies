# Pull Base Image
FROM tomcat:10-jdk17

# Maintainer information
LABEL maintainer="kanchaka77@gmail.com"

# Remove the default ROOT webapp to avoid conflicts
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy .war file on to container
COPY XYZtechnologies-1.0.war /usr/local/tomcat/webapps/ROOT.war

# Expose the port Tomcat is running on
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
