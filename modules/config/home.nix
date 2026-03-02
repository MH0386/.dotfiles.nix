{
  delib,
  moduleSystem,
  homeManagerUser,
  config,
  pkgs,
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
      backupFileExtension = "home_manager_backup";
    };
  };

  home.always =
    { myconfig, ... }:
    {
      home.homeDirectory = "/home/${myconfig.constants.username}";
    };
}
