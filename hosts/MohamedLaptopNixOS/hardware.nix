{
  delib,
  ...
}:
let
  systemArch = "x86_64-linux";
  stateVersion = "26.05";
in
delib.host {
  name = "MohamedLaptopNixOS";

  # myconfig.boot.mode = "uefi";
  system = systemArch;
  homeManagerSystem = systemArch;
  home.home.stateVersion = stateVersion;

  nixos = {
    nixpkgs.hostPlatform = systemArch;
    system.stateVersion = stateVersion;
    imports = [ ./hardware-configuration.nix ];
  };
}
