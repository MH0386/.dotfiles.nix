{ delib, pkgs, ... }:
delib.module {
  name = "user";

  nixos.always =
    { myconfig, ... }:
    let
      inherit (myconfig.constants) username;
    in
    {
      users = {
        groups.${username} = { };
        users.${username} = {
          shell = pkgs.zsh;
          isNormalUser = true;
          description = "Mohamed Hisham";
          extraGroups = [
            "adbusers"
            "docker"
            "flatpak"
            "libvirtd"
            "networkmanager"
            "podman"
            "render"
            "video"
            "wheel"
          ];
        };
      };
    };
}
