FROM haskell:8.0

LABEL maintainer="Alien6 <contact@alien6.com>" \
		  version="1.0" \
	  	original.author="James Gregory <james@jagregory.com>"

# install latex packages
RUN apt-get update -y \
  && apt-get install -y -o Acquire::Retries=10 --no-install-recommends \
    texlive-latex-base \
    texlive-xetex latex-xcolor \
    texlive-math-extra \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-bibtex-extra \
    fontconfig \
    lmodern

# install pandoc
RUN cabal update && cabal install pandoc && cabal install pandoc-citeproc

WORKDIR /source

ENTRYPOINT ["/root/.cabal/bin/pandoc"]

CMD ["--help"]
