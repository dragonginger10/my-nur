# Shell for bootstapping and dev work
{pkgs ? (import ./nixpkgs.nix) {}, ...}: {
  default = pkgs.mkShell {
    NIX_CONFIG = "experimental-features = nix-command flakes";
    nativeBuildInputs = with pkgs; [
      nix
      statix
      nix-init
    ];
  };
}
