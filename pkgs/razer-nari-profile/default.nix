{
  stdenv,
  fetchFromGitHub,
}: let
  name = "razer-nari-profile";
  version = "1.1";
in
  stdenv.mkDerivation {
    inherit name version;
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/share/alsa-card-profile/alsa-mixer/paths
      mkdir -p $out/share/alsa-card-profile/alsa-mixer/profile-sets
      mkdir -p $out/lib/udev/rules.d
      cp $src/razer-nari-input.conf $out/share/alsa-card-profile/alsa-mixer/paths
      cp $src/razer-nari-output-{game,chat}.conf $out/share/alsa-card-profile/alsa-mixer/paths
      cp $src/razer-nari-usb-audio.conf $out/share/alsa-card-profile/alsa-mixer/profile-sets
      cp $src/91-pulseaudio-razer-nari.rules $out/lib/udev/rules.d
    '';

    src = fetchFromGitHub {
      owner = "mrquantumoff";
      repo = "razer-nari-pipewire-profile";
      rev = "v${version}";
      hash = "sha256-tufGxESIToWmcOWh+B8sGZF0IAQv9TRXhzoZfyqa59g=";
    };
}
