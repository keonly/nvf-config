{
  description = "My standalone neovim configuration in nvf";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-helpers = {
      url = "github:keonly/nix-helpers";
      inputs.flake-parts.follows = "flake-parts";
    };
  };

  outputs = {
    self,
    nixpkgs,
    flake-parts,
    nvf,
    nix-helpers,
    ...
  } @ inputs: let
    inherit (nixpkgs) lib;
    systems = lib.systems.flakeExposed;
  in
    flake-parts.lib.mkFlake {inherit inputs;} {
      inherit systems;
      perSystem = {pkgs, ...}: {
        formatter = pkgs.alejandra;

        packages = let
          mkNeovimConfiguration = modules:
            (nvf.lib.neovimConfiguration {
              inherit pkgs modules;
              extraSpecialArgs = {inherit nix-helpers;};
            }).neovim;

          sources = rec {
            default = qwerty;
            qwerty = [./modules/qwerty.nix];
            colemak-dh = [./modules/colemak-dh];
          };
        in
          builtins.mapAttrs (_: modules: mkNeovimConfiguration modules) sources;
      };
    };
}
