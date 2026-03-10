{
  delib,
  pkgs,
  # colorscheme,
  ...
}:
delib.module {
  name = "cursor";

  options.cursor = with delib; {
    enable = boolOption true;
    name = strOption "WhiteSur-cursors";
    package = packageOption pkgs.whitesur-cursors;
    size = intOption 24;
  };

  home.ifEnabled =
    { cfg, ... }:
    {
      home.pointerCursor = {
        enable = true;
        gtk.enable = true;
        x11.enable = true;
        hyprcursor.enable = true;

        inherit (cfg) name package size;
      };
      gtk.cursorTheme = {
        inherit (cfg) name package size;
      };
    };
}
