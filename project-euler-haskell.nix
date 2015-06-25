{ mkDerivation, base, containers, data-ordlist, digits, hspec, text
, stdenv
}:
mkDerivation {
  pname = "project-euler-haskell";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  buildDepends = [ base containers data-ordlist digits text ];
  testDepends = [ base containers data-ordlist digits hspec text ];
  license = stdenv.lib.licenses.unfree;
}
