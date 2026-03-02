{ delib, pkgs, ... }:
delib.module {
  name = "fluffychat";

  options.fluffychat = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.fluffychat ];
}
