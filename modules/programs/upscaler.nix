{ delib, pkgsStable, ... }:
delib.module {
  name = "upscaler";

  options.upscaler = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = [ pkgsStable.upscaler ];
}
