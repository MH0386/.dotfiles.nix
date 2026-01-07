{ pkgs, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mohamed = {
    shell = pkgs.xonsh;
    isNormalUser = true;
    description = "Mohamed Hisham";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "render"
      "adbusers"
      "libvirtd"
      "podman"
      "flatpak"
    ];
  };
}
