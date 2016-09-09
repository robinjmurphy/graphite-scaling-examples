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
RUN yum install -y libffi-devel
RUN yum install -y cairo

# Python dependencies
RUN pip install --upgrade pip
RUN pip install -r https://raw.githubusercontent.com/graphite-project/carbon/0.9.15/requirements.txt
RUN pip install -r https://raw.githubusercontent.com/graphite-project/graphite-web/0.9.15/requirements.txt
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

# Graphite web config
ADD ./src/opt/graphite/webapp/graphite/local_settings.py /opt/graphite/webapp/graphite/local_settings.py

# Setup DB
RUN PYTHONPATH=/opt/graphite/webapp django-admin.py syncdb --settings=graphite.settings --noinput

# Permissions
RUN chown -R www-data:www-data /opt/graphite

# Graphite web port
EXPOSE 8080

# Carbon line receiver port
EXPOSE 2003

# Carbon pickle receiver port
EXPOSE 2004

# Carbon query port
EXPOSE 7002

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
