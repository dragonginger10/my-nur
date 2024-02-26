{ lib
, stdenv
, fetchFromGitHub
}:let
  pname = "fake-compiler";
  version = "unstable-2023-08-21";
in
stdenv.mkDerivation rec {
  inherit pname version;

  src = fetchFromGitHub {
    owner = "dragonginger10";
    repo = pname;
    rev = "913a754f2213618860f4725d1a14cf4e3d0811f0";
    hash = "sha256-PVSTNKlXcN80lwQygHMaKTYxf4ZTwnD1RpCL6ijKtpA=";
  };

  meta = with lib; {
    description = "A bash script that generate a fake compiler log";
    homepage = "https://github.com/dragonginger10/fake-compiler";
    license = licenses.unfree; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [ dragonginger ];
    mainProgram = "fake-compiler";
    platforms = platforms.all;
  };
}
