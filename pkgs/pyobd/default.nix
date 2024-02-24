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
  version = "1.0.0";
  pname = "pyobd";
in
  buildPythonPackage {
    inherit pname version;

    format = "pyproject";

    src = fetchFromGitHub {
      owner = "dragonginger10";
      repo = pname;
      rev = "v${version}";
      hash = "sha256-fbS+TmXmS805N42e9vQu4VwxwFu9jUWIcXgB8kQL6K4=";
    };

    nativeBuildInputs = [setuptools];

    propagatedBuildInputs = [
      wxPython_4_2
      numpy
      pyserial
      tornado
      pint
    ];

    doCheck = false;
  }
