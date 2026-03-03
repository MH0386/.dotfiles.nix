{ delib, ... }:
delib.module {
  name = "lapce";

  options.lapce = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.lapce = {
        inherit (cfg) enable;
      };
    };
}
