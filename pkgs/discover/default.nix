{ lib
, python3
, fetchFromGitHub
}:

python3.pkgs.buildPythonApplication rec {
  pname = "discover";
  version = "0.7.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "trigg";
    repo = "Discover";
    rev = "v${version}";
    hash = "sha256-//QW6N87Uhm2aH0RSuykHG3+EfzYSHOcSNLSn1y0rFw=";
  };

  buildInputs = [
    gtk3
    gobject-introspection
  ];

  nativeBuildInputs = with python3.pkgs; [
    setuptools
  ];

  propagatedBuildInputs = with python3.pkgs; [
    pygobject3
    websocket-client
    pyxdg
    requests
    pillow
    xlib
  ];
}
