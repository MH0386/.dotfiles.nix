{
  den.default = {
    nixos.programs.appimage = {
      enable = true;
      binfmt = true;
    };
    homeManager =
      { pkgs, ... }:
      {
        home.packages = [ pkgs.gearlever ];
      };
  };
}
