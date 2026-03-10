{ delib, ... }:
delib.module {
  name = "yazi";

  options.yazi = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.yazi = {
        inherit (cfg) enable;
      };
    };
}
