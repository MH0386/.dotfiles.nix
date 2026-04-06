{
  den.default = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          httpie
          httpie-desktop
        ];
      };
  };
}
