# Project Euler in Haskell

Set up:

```
cabal sandbox init
cabal install --enable-tests
```

Or with Docker:

```
docker build -t project-euler-haskell .
docker run -it --rm -v `pwd`:/code project-euler-haskell bash
```

Solve a problem with `cabal run <problem_number>`.

Solve all problems with `cabal run`.

Run the tests with `cabal test`.
