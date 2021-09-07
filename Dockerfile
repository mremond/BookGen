# ./Dockerfile
ARG base_tag="2.14"
FROM pandoc/latex:${base_tag}

LABEL authors="Mickaël Rémond"

RUN apk --no-cache add git

RUN tlmgr install tex-gyre ucs titlesec adjustbox babel-german \
  background bidi collectbox csquotes everypage filehook footmisc \
  footnotebackref framed fvextra letltxmacro ly1 mdframed mweights \
  needspace pagecolor sourcecodepro sourcesanspro titling ucharcat \
  ulem unicode-math upquote xecjk xurl zref

RUN cd /opt/texlive/texmf-local/tex/latex/local/ && \
  git clone https://github.com/aginiewicz/createspace.git && \
  mktexlsr

ENTRYPOINT ["/usr/local/bin/pandoc"]
