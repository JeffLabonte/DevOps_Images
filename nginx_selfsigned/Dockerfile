FROM nginx:latest
MAINTAINER Jean-Francois Labonte <jeff.labonte12@gmail.com>

ENV DOMAIN_NAME="jenkins-jeff.ddns.net"

RUN apt update && \
    apt install -y git openssl

COPY configs/default /etc/nginx/sites-enabled

ADD scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
