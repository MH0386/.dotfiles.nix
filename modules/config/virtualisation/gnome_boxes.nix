{ delib, pkgs, ... }:
delib.module {
  name = "gnome-boxes";

  options.gnome-boxes = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.gnome-boxes ];
}
