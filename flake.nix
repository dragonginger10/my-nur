{
  description = "My personal NUR repository";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
    };
  };
  outputs = {
    self,
    nixpkgs,
    pre-commit-hooks,
  }: let
    systems = [
      "x86_64-linux"
      "i686-linux"
      "x86_64-darwin"
      "aarch64-linux"
      "armv6l-linux"
      "armv7l-linux"
    ];
    forAllSystems = f: nixpkgs.lib.genAttrs systems f;
  in {
    checks = forAllSystems (system: {
      pre-commit-check = pre-commit-hooks.lib.${system}.run {
        src = ./.;
        hooks = {
          alejandra.enable = true;
        };
      };
    });
    formatter = forAllSystems (system: let pkgs = import nixpkgs {inherit system;}; in pkgs.alejandra);
    devShells = forAllSystems (system: let
      inherit (self.checks.${system}.pre-commit-check) shellHook;
      pkgs = import nixpkgs {inherit system;};
    in
      import ./shell.nix {inherit pkgs shellHook;});

    legacyPackages = forAllSystems (system:
      import ./default.nix {
        pkgs = import nixpkgs {inherit system;};
      });
    packages = forAllSystems (system: import ./default.nix {pkgs = import nixpkgs {inherit system;};});
  };
}
