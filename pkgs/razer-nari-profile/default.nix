{
  stdenv,
  fetchFromGitHub,
}: let
  name = "razer-nari-profile";
  version = "0.3";
in
  stdenv.mkDerivation {
    inherit name version;
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/share/pulseaudio/alsa-mixer/paths
      mkdir -p $out/share/pulseaudio/alsa-mixer/profile-sets
      mkdir -p $out/lib/udev/rulse.d
      cp -aR $src/razer-nari-input.conf $out/share/pulseaudio/alsa-mixer/paths
      cp -aR $src/razer-nari-output-{game,chat}.conf $out/share/pulseaudio/alsa-mixer/paths
      cp -aR $src/razer-nari-usb-audio.conf $out/share/pulseaudio/alsa-mixer/profile-sets
      cp -aR $src/91-pulseaudio-razer-nari.rules /lib/udev/rules.d
    '';

    src = fetchFromGitHub {
      owner = "imustafin";
      repo = "razer-nari-pulseaudio-profile";
      rev = "v${version}";
      sha256 = "1lg10dyxgz080qfcp6k3zk6374jlj067s6p5fgx5r135ivy8mrki";
    };

    meta = {
      broken = true;
    };
  }
