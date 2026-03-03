{ delib, ... }:
delib.module {
  name = "pay-respects";

  options.pay-respects = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.pay-respects = {
        inherit (cfg) enable;
      };
    };
}
