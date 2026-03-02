{ delib, pkgs, ... }:
delib.module {
  name = "vlc";

  options.vlc = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.vlc ];
}
