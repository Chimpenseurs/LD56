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
        nativeBuildInputs = [pkgs.godot_4 pkgs.python3];
      };

      packages.default = pkgs.stdenv.mkDerivation rec {
        stdenv = pkgs.stdenv;

        godot_version_folder = pkgs.lib.replaceStrings ["-"] ["."] pkgs.godot_4.version;
        name = "godot-game";
        src = ./.;

        nativeBuildInputs = [
          pkgs.autoPatchelfHook
          pkgs.godot_4
          pkgs.godot_4-export-templates
        ];

        runtimeDependencies = map pkgs.lib.getLib [
          pkgs.alsa-lib
          pkgs.libGL
          pkgs.libpulseaudio
          pkgs.xorg.libX11
          pkgs.xorg.libXcursor
          pkgs.xorg.libXext
          pkgs.xorg.libXi
          pkgs.xorg.libXrandr
          pkgs.udev
          pkgs.vulkan-loader
        ];

        buildPhase = ''
          runHook preBuild
          cd godot

          export HOME=$(mktemp -d)
          mkdir -p $HOME/.local/share/godot/export_templates

          ln -s "${pkgs.godot_4-export-templates}" "$HOME/.local/share/godot/export_templates/${godot_version_folder}"

          mkdir -p _build/
          godot4 --headless --export-release Web ./_build/LD56.html

          runHook postBuild
        '';

        installPhase = ''
          mkdir -p $out
          cp -r _build/* $out
        '';
      };

      # nix fmt .
      formatter = pkgs.alejandra;
    });
}
