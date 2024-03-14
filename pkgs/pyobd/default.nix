{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  wxPython_4_2,
  numpy,
  pyserial,
  tornado,
  pint,
  setuptools,
}: let
  version = "main";
  pname = "pyobd";
in
  buildPythonPackage {
    inherit pname version;

    format = "pyproject";

    src = fetchFromGitHub {
      owner = "dragonginger10";
      repo = pname;
      rev = "${version}";
      hash = "sha256-XDn6u7butvH7YBiqeyTDeH5u6JPsnUzxEqpzfPw/ok0=";
    };

    nativeBuildInputs = [setuptools];

    propagatedBuildInputs = [wxPython_4_2 numpy pyserial tornado pint];

    doCheck = false;

    meta = {broken = true;};
  }
