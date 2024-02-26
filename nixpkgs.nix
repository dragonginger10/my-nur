# This is for the shell.nix to use the flake.lock to get the specific nixpkgs for non flake shells
let
  lock = (builtins.fromJSON (builtins.readFile ./flake.lock)).nodes.nixpkgs.locked;
in
  import (fetchTarball {
    url = "https://github.com/nixos/nixpkgs/archive/${lock.rev}.tar.gz";
    sha256 = lock.narHash;
  })
