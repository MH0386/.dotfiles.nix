{
  den.schema.conf = {
    homeManager =
      { pkgs, ... }:
      {
        home.pointerCursor = {
          enable = true;
          gtk.enable = true;
          x11.enable = true;
          hyprcursor.enable = true;
          name = "WhiteSur-cursors";
          package = pkgs.whitesur-cursors;
          size = 24;
        };
        gtk.cursorTheme = {
          name = "WhiteSur-cursors";
          package = pkgs.whitesur-cursors;
          size = 24;
        };
      };
  };
}
