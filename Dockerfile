FROM fedora
MAINTAINER Alain Dejoux <adejoux@krystalia.net>

# update packages
RUN yum update -y

# install latest version of influxdb
RUN yum install -y http://s3.amazonaws.com/influxdb/influxdb-latest-1.x86_64.rpm

# Add grafana  repository
ADD grafana.repo /etc/yum.repos.d/grafana.repo

RUN yum install -y wget
#install grafana 
RUN yum install -y grafana
# upload and configure for execution start.sh script
ADD start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]
