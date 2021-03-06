FROM nginx:alpine
#Remove default config
RUN rm /etc/nginx/conf.d/default.conf /usr/share/nginx/html/*
#Add custom nginx config
COPY ./dtester.conf /etc/nginx/conf.d/
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD ["nginx", "-g", "daemon off;"]
ENTRYPOINT ["/entrypoint.sh"]
