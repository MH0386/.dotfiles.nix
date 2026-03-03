{ delib, pkgs, ... }:
delib.module {
  name = "fluffychat";

  options.fluffychat = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.fluffychat ];
}
