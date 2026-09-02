{
  den.default = {
    homeManager =
      { pkgs, ... }:
      let
        cursorName = "WhiteSur-cursors";
      in
      {
        home.pointerCursor = {
          enable = true;
          gtk.enable = true;
          x11.enable = true;
          hyprcursor.enable = true;
          name = cursorName;
          package = pkgs.whitesur-cursors;
          size = 24;
        };
        gtk.cursorTheme = {
          name = cursorName;
          package = pkgs.whitesur-cursors;
          size = 24;
        };
      };
  };
}
