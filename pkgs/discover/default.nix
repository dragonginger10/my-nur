{
  lib,
  python3,
  fetchFromGitHub,
  gtk3,
  gobject-introspection,
  wrapGAppsHook,
}:
python3.pkgs.buildPythonApplication rec {
  pname = "discover";
  version = "0.7.1";

  src = fetchFromGitHub {
    owner = "trigg";
    repo = "Discover";
    rev = "v${version}";
    hash = "sha256-4x2JERWSdqPXMRlH1vesxy9tqqRzkNHpZ8ECuHftgi8=";
  };

  buildInputs = [gtk3];

  nativeBuildInputs = [gobject-introspection wrapGAppsHook];

  makeWrapperArgs = ["--set DISPLAY ':0.0'"];

  propagatedBuildInputs = with python3.pkgs; [
    pycairo
    setuptools
    pygobject3
    websocket-client
    pyxdg
    requests
    pillow
    xlib
  ];
  doCheck = false;
}
