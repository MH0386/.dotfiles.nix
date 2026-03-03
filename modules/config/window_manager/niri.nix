{ delib, pkgs, ... }:
delib.module {
  name = "niri";

  options.niri = with delib; {
    enable = boolOption true;
    package = packageOption pkgs.niri;
    iio-niri.enable = boolOption true;
  };

  nixos.ifEnabled =
    { cfg, ... }:
    {
      programs.niri.enable = cfg.enable;
      services.iio-niri.enable = cfg.iio-niri.enable;
    };

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.niri = {
        inherit (cfg) enable;
        inherit (cfg) package;
      };
    };
}
