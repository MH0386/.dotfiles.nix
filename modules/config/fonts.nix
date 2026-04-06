{
  den.default = {
    homeManager =
      { pkgs, ... }:
      {
        fonts.fontconfig.enable = true;
        home.packages = with pkgs; [
          noto-fonts
          # icons
          font-awesome
          material-design-icons
        ];
      };

    nixos =
      { pkgs, ... }:
      {
        fonts.packages = with pkgs; [ monaspace ];
        console.packages = with pkgs; [ monaspace ];
      };
  };
}
