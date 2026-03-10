{
  delib,
  moduleSystem,
  homeManagerUser,
  config,
  pkgs,
  inputs,
  ...
}:
delib.module {
  name = "home-manager";

  myconfig.always.args.shared.homeconfig =
    if moduleSystem == "home" then config else config.home-manager.users.${homeManagerUser};

  nixos.always = {
    environment.systemPackages = [ pkgs.home-manager ];
    home-manager = {
      useUserPackages = true;
      useGlobalPkgs = true;
      verbose = true;
      backupFileExtension = "home_manager_backup";
      # users.mohamed = {
      #   imports = [
      #     inputs.nix-flatpak.homeManagerModules.nix-flatpak
      #     inputs.niri.homeModules.niri
      #     inputs.dms.homeModules.dank-material-shell
      #     inputs.dms.homeModules.niri
      #   ];
      # };
    };
  };

  home.always =
    { myconfig, ... }:
    {
      imports = [
        inputs.nix-flatpak.homeManagerModules.nix-flatpak
        inputs.niri.homeModules.niri
        inputs.dms.homeModules.dank-material-shell
        inputs.dms.homeModules.niri
      ];
      home.homeDirectory = "/home/${myconfig.constants.username}";
      home.username = "${myconfig.constants.username}";
    };
}
