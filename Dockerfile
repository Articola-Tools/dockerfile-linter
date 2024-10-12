FROM ghcr.io/hadolint/hadolint:2.12.1-beta-alpine

COPY ./ /linter_workdir

# NOTE: we need to have a separate directory for linter to work only with needed files,
# not with files from the entire system.
WORKDIR /linter_workdir

HEALTHCHECK --timeout=1s --retries=1 CMD hadolint --version || exit 1

ENTRYPOINT ["/bin/sh", "-c", "find /linter_workdir/repo -name 'Dockerfile*' -type f | \
while read -r dockerfile; do hadolint \"$dockerfile\"; done"]