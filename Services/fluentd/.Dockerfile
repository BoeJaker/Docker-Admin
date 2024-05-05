FROM fluent/fluentd:v1.12.0-debian-1.0

USER root

COPY vault-bootstrap/bootstrap.sh /secret/bootstrap.sh
COPY vault-bootstrap/bootstrap.env /secret/bootstrap.env
# COPY services/vulnlab/secrets.env /secret/secrets.env
COPY vault-bootstrap/password_prompt.sh /secret/password_prompt.sh


RUN apt update
RUN apt install build-essential ruby-dev libpq-dev -y
RUN ["gem", "install", "fluent-plugin-postgres", "--no-document"]
run gem install excon  -v 0.109.0 --no-document
RUN gem install fluent-plugin-docker_metadata_filter --no-document
RUN gem install fluent-plugin-rewrite-tag-filter --no-document
RUN gem install fluent-plugin-grok-parser --no-document
USER fluent

# ENTRYPOINT /secret/bootstrap.sh  "tini -- /bin/entrypoint.sh"