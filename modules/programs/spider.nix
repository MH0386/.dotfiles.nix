{ delib, ... }:
delib.module {
  name = "spider";

  options.spider = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.services.flatpak.packages = [ "io.github.zaedus.spider" ];
}
