FROM nginx
#Remove default config
RUN rm /etc/nginx/conf.d/default.conf /usr/share/nginx/html/*
#Add custom nginx config
COPY ./dtester.conf /etc/nginx/conf.d/
RUN chmod +x /entrypoint.sh
COPY ./entrypoint.sh /entrypoint.sh
CMD ["nginx", "-g", "daemon off;"]
ENTRYPOINT ["/entrypoint.sh", "/usr/sbin/httpd"]
