FROM node:4

RUN git clone https://github.com/etsy/statsd.git /opt/statsd

ADD config.js /opt/statsd/config.js

EXPOSE 8125/udp

CMD ["node", "/opt/statsd/stats.js", "/opt/statsd/config.js"]
