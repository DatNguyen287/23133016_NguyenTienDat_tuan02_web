FROM tomcat:9.0-jre8

# Copy WAR thành ROOT.war
COPY target/mywebapp.war /usr/local/tomcat/webapps/ROOT.war

# Nếu $PORT tồn tại (Render), thay port; còn không, giữ 8080
CMD if [ -n "$PORT" ]; then \
        sed -i "s/port=\"8080\"/port=\"$PORT\"/" /usr/local/tomcat/conf/server.xml; \
    fi && catalina.sh run
