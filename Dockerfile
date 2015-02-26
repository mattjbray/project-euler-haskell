FROM haskell:7.8

RUN cabal update && \
    cabal install hlint ghc-mod

ENV PATH /root/.cabal/bin:$PATH

WORKDIR /code

ADD . /code

RUN cabal update && \
    cabal install --enable-tests
