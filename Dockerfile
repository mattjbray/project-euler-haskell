FROM haskell:7.8

RUN cabal update && \
    cabal install hlint ghc-mod

ADD . /code

WORKDIR /code

RUN cabal update && \
    cabal install --enable-tests
