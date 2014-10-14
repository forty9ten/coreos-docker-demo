FROM ubuntu

RUN apt-get update && apt-get install -y
RUN apt-get install wget haproxy -y
RUN wget -O confd https://github.com/kelseyhightower/confd/releases/download/v0.5.0/confd-0.5.0-linux-amd64
RUN chmod +x confd && mv confd /usr/local/bin/confd
RUN mkdir -p /etc/confd/{conf.d,templates}
ADD confd/demo-haproxy.toml /etc/confd/conf.d/demo-haproxy.toml
ADD confd/haproxy.cfg.tmpl /etc/confd/templates/haproxy.cfg.tmpl

ADD start.sh /haproxy/start.sh
ADD haproxy /etc/default/haproxy

EXPOSE 80
EXPOSE 9000

CMD ["/haproxy/start.sh"]
