{
  description = "My NixOS Flake";

  inputs = {
    nix-flatpak.url = "https://flakehub.com/f/gmodena/nix-flatpak/*.tar.gz";
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nix-software-center = {
      url = "github:snowfallorg/nix-software-center";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-conf-editor = {
      url = "github:snowfallorg/nixos-conf-editor";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    fh = {
      url = "https://flakehub.com/f/DeterminateSystems/fh/*.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    android-nixpkgs = {
      url = "github:tadfisher/android-nixpkgs/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      fh,
      nix-flatpak,
      android-nixpkgs,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.MohamedLaptopNixOS = nixpkgs.lib.nixosSystem {
        system = system;
        modules = [
          nix-flatpak.nixosModules.nix-flatpak
          ./nixos/configuration.nix
        ];
        specialArgs = {
          inherit inputs;
          inherit system;
          inherit fh;
        };
      };
    };
}
