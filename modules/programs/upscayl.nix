{ delib, pkgsStable, ... }:
delib.module {
  name = "upscayl";

  options.upscayl = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = [ pkgsStable.upscayl ];
}
