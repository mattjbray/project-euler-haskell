FROM haskell:7.8

RUN cabal update && \
    cabal install hlint ghc-mod

RUN echo "PATH=/root/.cabal/bin:$PATH" >> /root/.bashrc

WORKDIR /code

ADD . /code

RUN cabal update && \
    cabal install --enable-tests
