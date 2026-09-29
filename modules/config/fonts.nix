{
  den.default = {
    homeManager =
      { pkgs, ... }:
      {
        fonts.fontconfig.enable = true;
        home.packages = [
          pkgs.noto-fonts
          # icons
          pkgs.font-awesome
          pkgs.material-design-icons
        ];
      };

    nixos =
      { pkgs, ... }:
      {
        fonts.packages = [ pkgs.monaspace ];
        console.packages = [ pkgs.monaspace ];
      };
  };
}
