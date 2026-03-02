{ delib, ... }:
delib.module {
  name = "gtk";

  home.always.gtk = {
    enable = true;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
  };
}
