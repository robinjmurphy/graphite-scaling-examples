FROM centos:7

# RPM dependencies
RUN yum groupinstall -y "Development tools"
RUN yum install -y epel-release
RUN yum install -y memcached
RUN yum install -y python-memcached
RUN yum install -y python-gunicorn
RUN yum install -y python-pip
RUN yum install -y python-devel
RUN yum install -y systemd
RUN yum install -y supervisor

# Python dependencies
RUN pip install --upgrade pip
RUN pip install whisper
RUN pip install carbon
RUN pip install graphite-web

# Create www-user
RUN adduser www-data
RUN usermod -a -G www-data www-data

# Supervisord config
ADD	./src/etc/supervisor/conf.d/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Carbon config
ADD ./src/opt/graphite/conf/carbon.conf /opt/graphite/conf/carbon.conf
ADD ./src/opt/graphite/conf/storage-schemas.conf /opt/graphite/conf/storage-schemas.conf
ADD ./src/opt/graphite/conf/storage-aggregation.conf /opt/graphite/conf/storage-aggregation.conf

# Permissions
RUN chown -R www-data:www-data /opt/graphite

# Graphite web
EXPOSE 8080

# Carbon line receiver
EXPOSE 2003

# Carbon pickle receiver
EXPOSE 2004

# Carbon query port
EXPOSE 7002

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
