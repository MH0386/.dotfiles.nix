{
  description = "My NixOS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs?ref=nixos-24.11";
    nix-flatpak.url = "https://flakehub.com/f/gmodena/nix-flatpak/*.tar.gz";
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
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:MarceColl/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-stable,
      fh,
      nix-flatpak,
      home-manager,
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
      nixosConfigurations =
        let
          hostNames = [
            "MohamedDesktop"
            "MohamedLaptop"
          ];
          inherit (nixpkgs) lib;
          commonModules = [
            nix-flatpak.nixosModules.nix-flatpak
            home-manager.nixosModules.home-manager
            ./nixos/configuration.nix
          ];
        in
        lib.pipe hostNames [
          (map (
            hostName:
            lib.nameValuePair hostName (
              lib.nixosSystem {
                inherit system;
                modules =
                  commonModules
                  ++ [ { networking.hostName = hostName; } ] # Sets the hostname
                  ++ [ (./. + "/devices/${hostName}/configuration.nix") ]; # Imports the per-host configuration.nix
                specialArgs = {
                  inherit inputs;
                  inherit system;
                  inherit fh;
                  inherit pkgsStable;
                };
              }
            )
          ))
          lib.listToAttrs
        ];
    };
}
