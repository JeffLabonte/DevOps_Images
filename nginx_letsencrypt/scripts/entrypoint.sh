#!/bin/bash
alias python=python3
alias pip=pip3

mv /etc/letsencrypt/configs/domain.conf /etc/letsencrypt/configs/${DOMAIN_NAME}.conf
sed -i "s/your-fully-qualified-domain/${DOMAIN_NAME}/" /etc/letsencrypt/configs/${DOMAIN_NAME}.conf

# Quick workaround with issue with Pip 19.0.1
sed -e "s/certbot-apache==0.30.0//g" -i /opt/letsencrypt/letsencrypt-auto
sed -e "s/--hash=sha256:d38c70fc6930db298ea992a3145362eebdce460d3d2651f86a8f2f43d838c6d0//g" -i /opt/letsencrypt/letsencrypt-auto
sed -e "s/--hash=sha256:1d4bc207d53a3e5d37e5d9ebd05f26089aa21d1fbf384113ed9d1829b4d1e9bf//g" -i /opt/letsencrypt/letsencrypt-auto

cd /opt/letsencrypt && ./letsencrypt-auto -v --config /etc/letsencrypt/configs/${DOMAIN_NAME}.conf certonly
exec $@
