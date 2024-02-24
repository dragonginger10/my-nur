{
  lib,
  fetchFromGitHub,
  mkTmuxPlugin,
}: let
  version = "1.0.0";
  pname = "tmux-spotify-info";
in
  mkTmuxPlugin {
    pluginName = pname;
    inherit version;
    src = fetchFromGitHub {
      owner = "Feqzz";
      repo = pname;
      rev = "master";
      sha256 = "Iy4n1DQQ8yRy/jGT74bfItF3GpOYVKxFwBo+GGX2hTM=";
    };
  }
