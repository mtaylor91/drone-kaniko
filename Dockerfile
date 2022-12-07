ARG KANIKO_VERSION=1.9.1
FROM gcr.io/kaniko-project/executor:v$KANIKO_VERSION as kaniko
ADD release/linux/amd64/kaniko-docker /kaniko/
ENTRYPOINT ["/kaniko/kaniko-docker"]
