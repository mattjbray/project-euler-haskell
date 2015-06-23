{ mkDerivation, base, containers, data-ordlist, digits, hspec
, stdenv
}:
mkDerivation {
  pname = "project-euler-haskell";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  buildDepends = [ base containers data-ordlist digits ];
  testDepends = [ base digits hspec ];
  license = stdenv.lib.licenses.unfree;
}
