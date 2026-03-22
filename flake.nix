{
  description = "Nix Flake for Python AI Project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable";
    devshell.url = "github:numtide/devshell";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      devshell,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (system: {
      devShell =
        let
          pkgs = import nixpkgs {
            inherit system;

            overlays = [ devshell.overlays.default ];
          };
        in
        let
          poetryWithPlugins = pkgs.poetry.withPlugins (ps: [ ps.poetry-plugin-up ]);
        in
        pkgs.devshell.mkShell {
          imports = [ (pkgs.devshell.importTOML ./devshell.toml) ];
          packages = [ pkgs.python313 poetryWithPlugins ];
        };
    });
}
