FROM fedora
MAINTAINER Alain Dejoux <adejoux@krystalia.net>

# update packages
RUN yum update -y

# install latest version of influxdb
RUN yum install -y http://get.influxdb.org/influxdb-0.9.0_rc27-1.x86_64.rpm

#install tar, wget and nginx
RUN yum install -y nginx wget tar

#Add nginx configuration file
ADD nginx.conf /etc/nginx/nginx.conf

# Add grafana  repository
ADD grafana.repo /etc/yum.repos.d/grafana.repo

#install grafana 
RUN yum install -y grafana

#change root_url 
RUN perl -pi -e 's#;root_url = %\(protocol\)s://%\(domain\)s:%\(http_port\)s/#root_url = %(protocol)s://%(domain)s:%(http_port)s/grafana#' /etc/grafana/grafana.ini

# upload and configure for execution start.sh script
ADD start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]
