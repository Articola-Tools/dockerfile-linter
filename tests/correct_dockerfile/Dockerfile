FROM alpine:3.20

RUN mkdir /linter_workdir

RUN addgroup -S lintergroup && adduser -S linteruser -G lintergroup && chown -R linteruser:lintergroup /linter_workdir

RUN apk add --no-cache wget=1.24.5-r0 \
    && wget --progress=dot:mega -O /linter_workdir/hadolint https://github.com/hadolint/hadolint/releases/download/v2.12.0/hadolint-Linux-x86_64 \
    && chmod +x /linter_workdir/hadolint \
    && apk del wget

# NOTE: we need to have a separate directory for linter to work only with needed files,
# not with files from the entire system.
WORKDIR /linter_workdir

USER linteruser

HEALTHCHECK --timeout=1s --retries=1 CMD /linter_workdir/hadolint --version || exit 1

ENTRYPOINT ["/bin/sh", "-c", "find /linter_workdir/repo -name 'Dockerfile*' -type f | \
while read -r dockerfile; do /linter_workdir/hadolint \"$dockerfile\"; done"]