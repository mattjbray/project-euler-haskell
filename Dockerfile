FROM haskell:7.8

ADD . /code

WORKDIR /code

RUN cabal update && \
    cabal install --enable-tests
