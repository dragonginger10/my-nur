{
  buildPythonApplication,
  fetchFromGitHub,
  setuptools,
  tqdm,
}: let
  pname = "progbar";
  version = "1.1.4";
in
  buildPythonApplication {
    inherit pname version;
    format = "pyproject";

    src = fetchFromGitHub {
      owner = "dragonginger10";
      repo = "useless-progress";
      rev = "v${version}";
      hash = "sha256-Zely1e/kATcRjwXPkCOIt5dXLfhf8x8j41JeBJJZ26g=";
    };

    postinstall = ''
      mv -v $src/progbar/phrases.txt $out/bin/phrases.txt
    '';

    nativeBuildInputs = [setuptools];
    propagatedBuildInputs = [tqdm];
  }
