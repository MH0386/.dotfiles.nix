{
  den.aspects.MohamedDesktopNixOS = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          ddcui
          ddcutil
        ];
      };
  };
}
