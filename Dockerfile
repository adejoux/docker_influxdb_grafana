FROM fedora
MAINTAINER Alain Dejoux <adejoux@krystalia.net>

# update packages
RUN yum update -y

# install latest version of influxdb
RUN yum install -y https://s3.amazonaws.com/influxdb/influxdb-0.9.3-1.x86_64.rpm

# Add grafana  repository
ADD grafana.repo /etc/yum.repos.d/grafana.repo

RUN yum install -y wget
#install grafana 
RUN yum install -y https://grafanarel.s3.amazonaws.com/builds/grafana-2.1.3-1.x86_64.rpm
RUN yum clean all
# upload and configure for execution start.sh script
ADD start.sh /start.sh
EXPOSE 3000
EXPOSE 8083
EXPOSE 8086
VOLUME /var/lib/grafana
RUN chmod +x /start.sh
CMD ["/start.sh"]
