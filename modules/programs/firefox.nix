{ delib, pkgsStable, ... }:
delib.module {
  name = "firefox";

  options.firefox = with delib; {
    enable = singleEnableOption true;
    package = packageOption pkgsStable.firefox;
    enablePWA = singleEnableOption true;
    packagePWA = packageOption pkgsStable.firefoxpwa;
  };

  home.ifEnabled.programs =
    { cfg, ... }:
    {
      firefox = {
        inherit (cfg) enable;
        inherit (cfg) package;
      };
      firefoxpwa = {
        enable = cfg.enablePWA;
        package = cfg.packagePWA;
      };
    };
}
