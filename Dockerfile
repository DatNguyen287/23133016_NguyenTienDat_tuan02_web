FROM tomcat:9.0-jre8

# Xóa webapps mặc định
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR thành ROOT.war
COPY target/mywebapp.war /usr/local/tomcat/webapps/ROOT.war

# Trước khi chạy Tomcat, thay 8080 bằng giá trị $PORT mà Render cấp
CMD sed -i "s/port=\"8080\"/port=\"${PORT}\"/" /usr/local/tomcat/conf/server.xml && catalina.sh run
