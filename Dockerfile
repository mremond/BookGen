# ./Dockerfile
ARG base_tag="2.14"
FROM pandoc/latex:${base_tag}

LABEL authors="Mickaël Rémond"

RUN tlmgr install clearspace || exit 1

ENTRYPOINT ["/usr/local/bin/pandoc"]
