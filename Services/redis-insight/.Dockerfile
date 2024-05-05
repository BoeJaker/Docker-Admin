FROM redis/redisinsight:latest as secure-bootstrap

RUN  export HOSTNAME=redis-ui
USER root
COPY vault-bootstrap/bootstrap.sh /secret/bootstrap.sh
COPY vault-bootstrap/bootstrap.env /secret/bootstrap.env

RUN chown -R root /secret
RUN chmod +x  /secret/bootstrap.sh

RUN apt update && apt install bash openssl gpg curl -y

WORKDIR /secret
RUN /secret/bootstrap.sh