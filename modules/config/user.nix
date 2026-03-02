{ delib, pkgs, ... }:
delib.module {
  name = "user";

  nixos.always.users =
    { myconfig, ... }:
    let
      inherit (myconfig.constants) username;
    in
    {
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
}
