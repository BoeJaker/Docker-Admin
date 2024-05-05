FROM postgres:latest

USER root
COPY vault-bootstrap/bootstrap.sh /secret/bootstrap.sh
COPY vault-bootstrap/bootstrap.env /secret/bootstrap.env

RUN chown -R root /secret
RUN chmod +x  /secret/bootstrap.sh

RUN apt update && apt install bash openssl gpg curl -y

WORKDIR /secret
RUN /secret/bootstrap.sh
WORKDIR /

COPY Scripts /Scripts
# COPY Config/client-id.txt /client-id.txt
# COPY Config/client-secret.txt /client-secret.txt
RUN chmod -R +x /Scripts
# USER postgres

RUN /Scripts/init.sh