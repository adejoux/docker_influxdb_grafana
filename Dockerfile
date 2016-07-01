FROM fedora
MAINTAINER Alain Dejoux <adejoux@krystalia.net>

# update packages
RUN dnf update -y

# install latest version of influxdb
RUN dnf install -y https://dl.influxdata.com/influxdb/releases/influxdb-0.13.0.x86_64.rpm

#install grafana 
RUN dnf install -y https://grafanarel.s3.amazonaws.com/builds/grafana-3.1.0-1466666977beta1.x86_64.rpm
RUN dnf clean all
# upload and configure for execution start.sh script
ADD start.sh /start.sh
EXPOSE 3000
EXPOSE 8083
EXPOSE 8086
VOLUME /var/lib/grafana
RUN chmod +x /start.sh
CMD ["/start.sh"]
