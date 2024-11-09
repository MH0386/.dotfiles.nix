{
  description = "My NixOS Flake";

  inputs = {
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
  };

  outputs =
    { nixpkgs, fh, ... }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.MohamedLaptopNixOS = nixpkgs.lib.nixosSystem {
        system = system;
        modules = [ ./nixos/configuration.nix ];
        specialArgs = {
          inherit inputs;
          inherit system;
          inherit fh;
        };
      };
    };
}
