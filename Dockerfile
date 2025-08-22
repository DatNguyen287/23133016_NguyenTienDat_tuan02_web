# Sử dụng image Tomcat chính thức
FROM tomcat:9.0-jre8

# Xóa webapps mặc định (ROOT, docs, examples...)
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file .war đã build thành ROOT.war (để chạy ở /)
COPY target/mywebapp.war /usr/local/tomcat/webapps/ROOT.war

# Copy file server.xml đã chỉnh sửa (Connector dùng ${PORT})
COPY server.xml /usr/local/tomcat/conf/server.xml

# Expose port (Render sẽ set PORT động, vẫn khai báo 8080 cho chuẩn Docker)
EXPOSE 8080

# Khởi động Tomcat
CMD ["catalina.sh", "run"]
