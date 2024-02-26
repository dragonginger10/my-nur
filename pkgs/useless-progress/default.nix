{
  buildPythonApplication,
  fetchFromGithub,
}: let
  pname = "progbar";
  version = "1.1.4";
in
  buildPythonApplication {
    inherit pname version;
    format = "pyproject";

    src = fetchFromGithub {
      owner = "dragonginger10";
      repo = "useless-progress";
      rev = "v${version}";
      hash = "";
    };

    postinstall = ''
      mv -v $src/progbar/phrases.txt $out/bin/phrases.txt
    '';

    nativeBuildInputs = [setuptools];
    propagatedBuildInputs = [tqdm];
  }
