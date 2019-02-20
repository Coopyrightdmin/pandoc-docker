FROM alpine:edge

LABEL maintainer="Alien6 <contact@alien6.com>" \
		  version="1.0" 

# install latex packages
RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories \
    && apk update \
    && apk add wget ghc cabal ca-certificates musl-dev shadow linux-headers zlib-dev 

# install pandoc
RUN cabal update && cabal install pandoc && cabal install pandoc-citeproc

WORKDIR /source

ENTRYPOINT ["/root/.cabal/bin/pandoc"]

CMD ["--help"]
