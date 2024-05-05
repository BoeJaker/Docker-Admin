FROM dpage/pgadmin4:latest as secure-bootstrap

# RUN  export HOSTNAME=pgadmin
# USER root
# COPY vault-bootstrap/bootstrap.sh /secret/bootstrap.sh
# COPY vault-bootstrap/bootstrap.env /secret/bootstrap.env

# # RUN chown -R pgadmin /secret
# # RUN chmod +x  /secret/bootstrap.sh

# RUN apk update && apk add bash openssl gpg curl

# WORKDIR /secret
# RUN /secret/bootstrap.sh echo " "
# WORKDIR /
# USER pgadmin