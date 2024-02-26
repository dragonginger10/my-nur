{
  fetchFromGitHub,
  buildPythonApplication,
  setuptools,
  requests,
  typer,
  rich,
  pandas,
}: let
  pname = "hypixelFlipper";
  version = "1.0";
in
  buildPythonApplication {
    inherit pname version;
    format = "pyproject";

    src = fetchFromGitHub {
      owner = "dragonginger10";
      repo = pname;
      rev = "main";
      hash = "sha256-NLMlWrGJzaMd0d3hm5ZgjF18JuVSl05pteYajAAoER8=";
    };

    nativeBuildInputs = [setuptools];
    propagatedBuildInputs = [
      requests
      pandas
      rich
      typer
    ];
  }
