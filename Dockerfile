# Sử dụng image Tomcat chính thức
FROM tomcat:9.0-jre8

# Copy file .war vào thư mục webapps của Tomcat
COPY target/mywebapp.war /usr/local/tomcat/webapps/

# Mở port 8080
EXPOSE 8080

# Khởi động Tomcat
CMD ["catalina.sh", "run"]