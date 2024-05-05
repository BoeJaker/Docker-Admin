FROM redis:latest as secure-bootstrap

RUN  export HOSTNAME=redis
USER root
COPY vault-bootstrap/bootstrap.sh /secret/bootstrap.sh
COPY vault-bootstrap/bootstrap.env /secret/bootstrap.env

RUN chown -R root /secret
RUN chmod +x  /secret/bootstrap.sh

RUN apk update && apk add bash openssl gpg curl -y

WORKDIR /secret
RUN /secret/bootstrap.sh