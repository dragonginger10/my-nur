{
  lib,
  stdenv,
  fetchFromGitHub,
  libpulseaudio,
}:
stdenv.mkDerivation rec {
  pname = "pulse-vumeter";
  version = "0.11";

  src = fetchFromGitHub {
    owner = "theRealCarneiro";
    repo = "pulse-vumeter";
    rev = "v${version}";
    hash = "sha256-7mwUOu0crGIq8jnQcNY/mKoqrfbibr2q/Yx0aoLBEVE=";
  };

  buildInputs = [libpulseaudio];

  meta = with lib; {
    description = "A cli vumeter for pulseaudio";
    homepage = "https://github.com/theRealCarneiro/pulse-vumeter";
    license = licenses.unfree; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [];
    mainProgram = "pulse-vumeter";
    platforms = platforms.all;
  };
}
