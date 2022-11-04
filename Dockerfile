ARG KANIKO_VERSION=1.9.1
FROM gcr.io/kaniko-project/executor:v$KANIKO_VERSION as kaniko
FROM alpine:latest as drone_kaniko
RUN apk --no-cache add bash xz && mkdir /workspace && mkdir -p /kaniko/.docker
COPY --from=kaniko /kaniko/executor /kaniko/executor
ENV DOCKER_CONFIG=/kaniko/.docker/
ENV DOCKER_CREDENTIAL_GCR_CONFIG=/kaniko/.config/gcloud/docker_credential_gcr_config.json
ENV KANIKO_VERSION=$KANIKO_VERSION
ENV SSL_CERT_DIR=/etc/ssl/certs
ADD release/linux/amd64/kaniko-docker /kaniko/
ENTRYPOINT ["/kaniko/kaniko-docker"]
