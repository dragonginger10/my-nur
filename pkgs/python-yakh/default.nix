{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
}: let
  version = "0.3.2";
in
  buildPythonPackage {
    inherit version;
    pname = "python-yakh";

    format = "pyproject";

    src = fetchFromGitHub {
      owner = "petereon";
      repo = "yakh";
      rev = "v${version}";
      hash = "sha256-mVXFAhK1SFIKxXYqNAnQEKhXukZuflXTRA4F/O0J+tM=";
    };

    nativeBuildInputs = [poetry-core];

    doCheck = false;
  }
