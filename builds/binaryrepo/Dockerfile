FROM centos:latest
RUN yum clean all
RUN yum install -y epel-release
RUN yum install -y nginx supervisor wget unzip
RUN wget https://releases.hashicorp.com/consul/0.6.4/consul_0.6.4_linux_amd64.zip -O /tmp/consul.zip
RUN unzip /tmp/consul.zip && rm -f /tmp/consul.zip && mv consul /usr/bin/ && chmod +x /usr/bin/consul && mkdir /etc/consul.d
COPY nginx.conf /etc/nginx/nginx.conf
COPY generate-consul-config.sh /usr/bin/generate-consul-config
CMD chmod +x /usr/bin/generate-consul-config
COPY entrypoint.ini /etc/supervisor.d/
CMD ["generate-consul-config","supervisord -c /etc/supervisord.conf"]