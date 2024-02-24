{
  stdenv,
  lib,
  fetchFromGitHub,
}:
stdenv.mkDerivation rec {
  pname = "zsh-extract";
  version = "0.1.0";

  # src = fetchFromGitHub {};
  src = ./.;

  strictDeps = true;

  dontBuild = true;

  installPhase = ''
    outdir=$out/share/zsh/${pname}
    install -D zsh-extract.plugin.zsh $outdir/zsh-extract.plugin.zsh
    install -D _extract $outdir/_extract
  '';

  # meta = with lib; {
  #   homepage = "https://github.com/marlonrichert/zsh-edit";
  #   description = "A set of powerful extensions to the Zsh command line editor";
  #   license = licenses.mit;
  #   maintainers = with maintainers; [ deejayem ];
  #   platforms = platforms.all;
  # };
}
