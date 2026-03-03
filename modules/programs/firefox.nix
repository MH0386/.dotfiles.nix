{ delib, pkgsStable, ... }:
delib.module {
  name = "firefox";

  options.firefox = with delib; {
    enable = boolOption true;
    package = packageOption pkgsStable.firefox;
    enablePWA = boolOption true;
    packagePWA = packageOption pkgsStable.firefoxpwa;
  };

  home.ifEnabled =
    { cfg, ... }:
    {
      programs = {
        firefox = {
          inherit (cfg) enable;
          inherit (cfg) package;
        };
        firefoxpwa = {
          enable = cfg.enablePWA;
          package = cfg.packagePWA;
        };
      };
    };
}
