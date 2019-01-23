FROM nvidia/cuda:latest
MAINTAINER Jean-Francois Labonte <jeff.labonte12@gmail.com>

RUN apt update && \
    apt install -qy \
    -o APT::Install-Recommend=false -o APT::Install-Suggests=false \
    python3 python3-virtualenv libpython3.7 lm-sensors

ADD scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

LABEL application=home_monitoring


