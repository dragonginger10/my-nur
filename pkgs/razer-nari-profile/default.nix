{
  stdenv,
  fetchFromGitHub,
}: let
  pname = "razer-nari-profile";
  version = "1.1";
in
  stdenv.mkDerivation {
    inherit pname version;
    dontBuild = true;
    phases = ["installPhase"];

    installPhase = ''
      install -Dm644 -t "$out/share/alsa-card-profile/mixer/paths/" $src/razer-nari-{input,output-{game,chat}}.conf
      install -Dm644 -t "$out/share/alsa-card-profile/mixer/profile-sets/" $src/razer-nari-usb-audio.conf
      install -Dm644 -t "$out/lib/udev/rules.d/" $src/91-pulseaudio-razer-nari.rules
    '';

    src = fetchFromGitHub {
      owner = "mrquantumoff";
      repo = "razer-nari-pipewire-profile";
      rev = "v${version}";
      hash = "sha256-tufGxESIToWmcOWh+B8sGZF0IAQv9TRXhzoZfyqa59g=";
    };
}
