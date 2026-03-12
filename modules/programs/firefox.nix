{
  den.schema.conf = {
    homeManager =
      { pkgsStable, ... }:
      {
        programs.firefox = {
          enable = true;
          package = pkgsStable.firefox;
        };
        programs.firefoxpwa = {
          enable = true;
          package = pkgsStable.firefoxpwa;
        };
      };
  };
}
