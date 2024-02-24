# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example'
{pkgs ? import <nixpkgs> {}}: rec {
  # example = pkgs.callPackage ./example { };
  sddm-catppuccin = pkgs.callPackage ./sddm-catppuccin {};
  icat = pkgs.callPackage ./icat {};
  python-yakh = pkgs.python311Packages.callPackage ./python-yakh {};
  beaupy = pkgs.python311Packages.callPackage ./beaupy {inherit python-yakh;};
  pyobd = pkgs.python310Packages.callPackage ./pyobd {};
  edex-ui = pkgs.callPackage ./edex-ui {};
  zsh-extract = pkgs.callPackage ./zsh-extract {};
  tkinterDesigner = pkgs.python311Packages.callPackage ./tkinterDesigner {};
  customtkinter = pkgs.callPackage ./customtkinter {};
}
