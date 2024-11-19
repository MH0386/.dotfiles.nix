{
  description = "My NixOS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs?ref=24.05";
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
    # android-nixpkgs = {
    #   url = "github:tadfisher/android-nixpkgs/stable";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    nix-flatpak.url = "https://flakehub.com/f/gmodena/nix-flatpak/*.tar.gz";
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-stable,
      fh,
      nix-flatpak,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgsStable = import nixpkgs-stable {
        system = system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations.MohamedLaptopNixOS = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          nix-flatpak.nixosModules.nix-flatpak
          ./nixos/configuration.nix
        ];
        specialArgs = {
          inherit inputs;
          inherit system;
          inherit fh;
          inherit pkgsStable;
        };
      };
    };
}
