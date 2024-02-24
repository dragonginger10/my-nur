# This file describes your repository contents.
# It should return a set of nix derivations
# and optionally the special attributes `lib`, `modules` and `overlays`.
# It should NOT import <nixpkgs>. Instead, you should take pkgs as an argument.
# Having pkgs default to <nixpkgs> is fine though, and it lets you use short
# commands such as:
#     nix-build -A mypackage

{ pkgs ? import <nixpkgs> { } }:

rec {
  # The `lib`, `modules`, and `overlays` names are special
  lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays

  example-package = pkgs.callPackage ./pkgs/example-package { };
  sddm-catppuccin = pkgs.callPackage ./pkgs/sddm-catppuccin {};
  icat = pkgs.callPackage ./pkgs/icat {};
  python-yakh = pkgs.python311Packages.callPackage ./pkgs/python-yakh {};
  beaupy = pkgs.python311Packages.callPackage ./pkgs/beaupy {inherit python-yakh;};
  pyobd = pkgs.python310Packages.callPackage ./pkgs/pyobd {};
  edex-ui = pkgs.callPackage ./pkgs/edex-ui {};
  zsh-extract = pkgs.callPackage ./pkgs/zsh-extract {};
  tkinterDesigner = pkgs.python311Packages.callPackage ./pkgs/tkinterDesigner {};
  customtkinter = pkgs.callPackage ./pkgs/customtkinter {}; # ...
}
