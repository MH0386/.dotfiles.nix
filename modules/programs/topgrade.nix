{ delib, ... }:
delib.module {
  name = "topgrade";

  options.topgrade = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.topgrade = {
        inherit (cfg) enable;
      };
    };
}
