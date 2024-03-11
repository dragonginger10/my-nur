{ lib
, python3
, fetchFromGitHub
}:

python3.pkgs.buildPythonApplication rec {
  pname = "pulsemeeter";
  version = "1.2.14";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "theRealCarneiro";
    repo = "pulsemeeter";
    rev = "v${version}";
    hash = "sha256-QTXVE5WvunsjLS8I1rgX34BW1mT1UY+cRxURwXiQp5A=";
  };

  nativeBuildInputs = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  propagatedBuildInputs = with python3.pkgs; [
    pulsectl
    pygobject3
    setuptools
  ] ++ (with pkgs; [
    gtk3
    libpulseaudio
    gobject-introspection
    libappindicator-gtk3
  ]);


  meta = with lib; {
    description = "Replicating voicemeeter routing functionalities in linux with pulseaudio";
    homepage = "https://github.com/theRealCarneiro/pulsemeeter";
    license = licenses.mit;
    # maintainers = with maintainers; [ ];
    mainProgram = "pulsemeeter";
  };
}
