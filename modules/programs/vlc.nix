{ delib, pkgs, ... }:
delib.module {
  name = "vlc";

  options.vlc = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.vlc ];
}
