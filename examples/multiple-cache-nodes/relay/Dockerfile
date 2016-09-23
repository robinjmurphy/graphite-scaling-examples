FROM graphite-common

# Carbon config
ADD ./carbon.conf /opt/graphite/conf/carbon.conf

# Graphite web config
ADD ./local_settings.py /opt/graphite/webapp/graphite/local_settings.py

# Supervisord config
ADD ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf
