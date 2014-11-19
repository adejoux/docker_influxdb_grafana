FROM fedora
MAINTAINER Alain Dejoux <adejoux@krystalia.net>

# update packages
RUN yum update -y

# install latest version of influxdb
RUN yum install -y http://s3.amazonaws.com/influxdb/influxdb-latest-1.x86_64.rpm

#install wget and nginx
RUN yum install -y nginx wget

#create web directory
RUN mkdir /www
RUN chown nginx: /www
WORKDIR /www

#download grafana in /www
RUN wget http://grafanarel.s3.amazonaws.com/grafana-1.8.1.tar.gz
RUN tar -xvzf grafana-1.8.1.tar.gz
RUN ln -s grafana-1.8.1 grafana

#configure nginx : web root dir: /www and no daemon mode
RUN perl -pi -e 's#root\s+/usr/share/nginx/html#root /www#' /etc/nginx/nginx.conf
RUN  echo "daemon off;" >> /etc/nginx/nginx.conf

# Add grafana configuration file
ADD config.js /www/grafana/config.js

# upload and configure for execution start.sh script
ADD start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]
