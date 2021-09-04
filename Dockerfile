# ./Dockerfile
ARG base_tag="2.14"
FROM pandoc/latex:${base_tag}

LABEL authors="Mickaël Rémond"

RUN apk install git

RUN mkdir -p /usr/local/share/texmf/tex/latex/ && \
  cd /usr/local/share/texmf/tex/latex/ && \
  git clone https://github.com/aginiewicz/createspace.git && \
  cd /usr/local/share/texmf/ && \
  mktexlsr

ENTRYPOINT ["/usr/local/bin/pandoc"]
