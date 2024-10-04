{
  description = "Flake for godot";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};
    in {
      # Development environment
      devShell = pkgs.mkShell {
        name = "godot4";
        nativeBuildInputs = [pkgs.godot_4];
      };

      # nix fmt .
      formatter = pkgs.alejandra;
    });
}
