{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
  python-yakh,
  rich,
  emoji,
}:
buildPythonPackage rec {
  version = "3.6.2";
  pname = "beaupy";

  format = "pyproject";

  src = fetchFromGitHub {
    owner = "dragonginger10";
    repo = "beaupy";
    rev = "v${version}";
    hash = "sha256-ta6VTN+fP2wCKs/N5+b5ge+n0OZFzxR1ZbKBlxDrSJk=";
  };

  nativeBuildInputs = [poetry-core];

  propagatedBuildInputs = [rich emoji python-yakh];

  doCheck = false;
}
