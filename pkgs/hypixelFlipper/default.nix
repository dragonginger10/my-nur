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

  src = fetchFromGitHub{
    owner = "dragonginger10";
    repo = pname;
    rev = "main";
    hash = "";
  };

  nativeBuildInputs = [setuptools];
  propagatedBuildInputs = [
    requests
    pandas
    rich
    typer
  ];
  
}
