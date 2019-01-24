FROM nginx:latest
MAINTAINER Jean-Francois Labonte <jeff.labonte12@gmail.com>

ENV DOMAIN_NAME="jenkins-jeff.ddns.net"

RUN apt update && \
    apt install -y git letsencrypt python3-pip python-pip

RUN pip install --upgrade pip && \
    pip3 install --upgrade pip

RUN git clone https://github.com/letsencrypt/letsencrypt /opt/letsencrypt &&\
    mkdir -p /etc/letsencrypt/configs/ && \
    mkdir -p /var/www/letsencrypt/

COPY configs/default /etc/nginx/sites-available/default
COPY configs/domain.conf /etc/letsencrypt/configs/

ADD scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
