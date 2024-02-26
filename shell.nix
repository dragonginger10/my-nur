# Shell for bootstapping and dev work
{pkgs ? (import ./nixpkgs.nix) {}, ...}: {
  default = pkgs.mkShell {
    NIX_CONFIG = "experimental-features = nix-command flakes";
    nativeBuildInputs = with pkgs; [
      nix
      just
      git
      home-manager
      nil
      taplo
      lua-language-server
      nodePackages.bash-language-server
      statix
      nix-init
    ];
  };
}
