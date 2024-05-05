FROM bitnami/openldap:latest as secure-bootstrap

RUN  export HOSTNAME=openldap
USER root
COPY vault-bootstrap/bootstrap.sh /secret/bootstrap.sh
COPY vault-bootstrap/bootstrap.env /secret/bootstrap.env
COPY services/vulnlab/secrets.env /secret/secrets.env
COPY vault-bootstrap/password_prompt.sh /secret/password_prompt.sh

RUN chown -R root /secret
RUN chmod +x  /secret/bootstrap.sh

RUN apt update && apt install bash openssl gpg curl -y

WORKDIR /secret
RUN /secret/bootstrap.sh
ENTRYPOINT /secret/bootstrap.sh /usr/sbin/run.sh