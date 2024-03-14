{
  lib,
  python3,
  fetchFromGitHub,
  gtk3,
  libappindicator,
  libpulseaudio,
  gobject-introspection,
  wrapGAppsHook,
  pulse-vumeter,
}:
python3.pkgs.buildPythonApplication rec {
  pname = "pulsemeeter";
  version = "1.2.14";

  src = fetchFromGitHub {
    owner = "theRealCarneiro";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-QTXVE5WvunsjLS8I1rgX34BW1mT1UY+cRxURwXiQp5A=";
  };

  buildInputs = [gtk3 libappindicator libpulseaudio pulse-vumeter];

  nativeBuildInputs = [wrapGAppsHook gobject-introspection];

  propagatedBuildInputs = with python3.pkgs; [pulsectl pygobject3 setuptools];

  makeWrapperArgs = ["--set DISPLAY ':0.0'"];

  doCheck = false;

  meta = with lib; {
    description = "Replicating voicemeeter routing functionalities in linux with pulseaudio";
    homepage = "https://github.com/theRealCarneiro/pulsemeeter";
    license = licenses.mit;
    # maintainers = with maintainers; [ ];
    mainProgram = "pulsemeeter";
  };
}
