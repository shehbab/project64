FROM ubuntu
MAINTAINER shehbab1@gmail.com

# avoid debconf errors
ENV DEBIAN_FRONTEND=noninteractive

# make sure everything is up to date - update and upgrade
#RUN apt-get update && apt-get upgrade -y && 

RUN apt-get update && \
    apt-get install -y nginx

# Remove the default Nginx configuration file
RUN rm -v /etc/nginx/nginx.conf

# Copy a configuration file from the current directory
COPY ./nginx.conf /etc/nginx/
COPY server.key /etc/nginx/
COPY server.crt /etc/nginx/


# volume used to keep logs
VOLUME ["/var/log/nginx"]
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

# Expose ports
EXPOSE 443

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/nginx"]
