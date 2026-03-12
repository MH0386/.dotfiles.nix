{
  den.schema.conf = {
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
