FROM metabase/metabase:latest as secure-bootstrap

RUN  export HOSTNAME=metabase
USER root
COPY vault-bootstrap/bootstrap.sh /secret/bootstrap.sh
COPY vault-bootstrap/bootstrap.env /secret/bootstrap.env

RUN chown -R root /secret
RUN chmod +x  /secret/bootstrap.sh

RUN apk update && apk add bash openssl gpg curl 

WORKDIR /secret
RUN /secret/bootstrap.sh
ENTRYPOINT /secret/bootstrap.sh /usr/sbin/run.sh