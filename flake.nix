{
  description = "Description for the project";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs@{ nixpkgs, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ ];
      systems = nixpkgs.lib.systems.flakeExposed;
      perSystem = { pkgs, lib, config, ... }: {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [ nodejs php phpPackages.composer flyctl ];
        };
      };
    };
}
