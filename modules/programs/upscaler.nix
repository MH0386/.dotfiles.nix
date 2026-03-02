{ delib, pkgsStable, ... }:
delib.module {
  name = "upscaler";

  options.upscaler = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = [ pkgsStable.upscaler ];
}
