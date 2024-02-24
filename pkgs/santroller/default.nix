{
  stdenv,
  fetchurl,
}: let
  pname = "SantrollerConfigurator-linux-64";
  version = "10.0.18";
in
  stdenv.mkDerivation {
    inherit pname version;

    src = fetchurl {
      url = "https://github.com/Santroller/Santroller/releases/download/v${version}/SantrollerConfigurator-linux-64";
      sha256 = "1vgif07y0xaigwb98cvn3ibzgy4aii00kas2vdr4x5wxplp6jppg";
    };

    installPhase = ''
      mkdir -p $out/bin
      cp ${pname} $out/bin
    '';
  }
