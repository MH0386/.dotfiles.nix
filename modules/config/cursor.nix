{
  den.default = {
    homeManager =
      { pkgs, ... }:
      let
        cursorName = "WhiteSur-cursors";
        cursorPackage = pkgs.whitesur-cursors;
        cursorSize = 24;
      in
      {
        home.pointerCursor = {
          enable = true;
          gtk.enable = true;
          x11.enable = true;
          hyprcursor.enable = true;
          name = cursorName;
          package = cursorPackage;
          size = cursorSize;
        };
        gtk.cursorTheme = {
          name = cursorName;
          package = cursorPackage;
          size = cursorSize;
        };
      };
  };
}
