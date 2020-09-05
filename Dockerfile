FROM nginx
#Remove default config
RUN rm /etc/nginx/conf.d/default.conf /usr/share/nginx/html/*
#Add custom nginx config
COPY ./dtester.conf /etc/nginx/conf.d/
COPY ./entrypoint.sh /entrypoint.sh
