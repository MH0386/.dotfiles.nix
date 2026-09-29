{
  den.aspects.MohamedDesktopNixOS = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = [
          pkgs.ddcui
          pkgs.ddcutil
        ];
      };
  };
}
