{ delib, ... }:
delib.module {
  name = "spider";

  options.spider = with delib; {
    enable = boolOption true;
    packages = listOfOption str [ "io.github.zaedus.spider" ];
  };

  home.ifEnabled =
    { cfg, ... }:
    {
      services.flatpak.packages = cfg.packages;
    };
}
