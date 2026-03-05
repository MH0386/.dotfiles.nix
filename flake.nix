{
  description = "MH0386's NixOS Configuration";

  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1";
    nixpkgs-stable.url = "https://flakehub.com/f/NixOS/nixpkgs/*";
    nix-flatpak.url = "https://flakehub.com/f/gmodena/nix-flatpak/*";
    # nix-software-center = {
    #   url = "github:ljubitje/nix-software-center";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # nixos-conf-editor = {
    #   url = "github:snowfallorg/nixos-conf-editor";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # fh = {
    #   url = "https://flakehub.com/f/DeterminateSystems/fh/*";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    denix = {
      url = "github:yunfachi/denix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    home-manager = {
      url = "https://flakehub.com/f/nix-community/home-manager/0.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lanzaboote = {
      url = "https://flakehub.com/f/nix-community/lanzaboote/*";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    portainer-on-nixos = {
      url = "gitlab:cbleslie/portainer-on-nixos";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-jetbrains-plugins = {
      url = "github:nix-community/nix-jetbrains-plugins";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dms-plugin-registry = {
      url = "github:AvengeMedia/dms-plugin-registry";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      denix,
      nixpkgs-stable,
      ...
    }@inputs:
    let
      pkgsStable = import nixpkgs-stable {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };

      mkConfigurations =
        moduleSystem:
        denix.lib.configurations rec {
          inherit moduleSystem;
          homeManagerUser = "mohamed";

          paths = [
            ./hosts
            ./modules
            # ./rices
          ];

          extensions = with denix.lib.extensions; [
            #rices
            args
            (base.withConfig {
              args.enable = true;

              hosts.features = {
                # cli: not must-have (ssh, git, gpg, fail2ban, dnscrypt) utilities like eza, bat, nh, etc.
                # gui: gui applications and modules that are needed only for gui applications (gnome-keyring, wakatime)
                features = [
                  "cli"
                  "gui"
                  "gaming"
                  "hacking"
                  "powersave"
                  "wireless"
                  "nvidia"
                ];
                defaultByHostType = {
                  laptop = [
                    "cli"
                    "gui"
                    "gaming"
                    "hacking"
                    "nvidia"
                  ];
                  server = [ ];
                };
              };
            })
          ];

          specialArgs = {
            inherit
              inputs
              moduleSystem
              homeManagerUser
              pkgsStable
              ;
          };
        };
    in
    {
      nixosConfigurations = mkConfigurations "nixos";
      homeConfigurations = mkConfigurations "home";
    };
}
