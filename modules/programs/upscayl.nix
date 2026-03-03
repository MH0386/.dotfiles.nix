{ delib, pkgsStable, ... }:
delib.module {
  name = "upscayl";

  options.upscayl = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = [ pkgsStable.upscayl ];
}
