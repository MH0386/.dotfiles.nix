{ delib, pkgs, ... }:
delib.module {
  name = "gnome-boxes";

  options.gnome-boxes = with delib; {
    enable = boolOption host.gnomeBoxesFeatured;
  };

  home.ifEnabled.home.packages = [ pkgs.gnome-boxes ];
}
