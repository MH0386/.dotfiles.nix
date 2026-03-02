{ delib, ... }:
delib.module {
  name = "topgrade";

  options.topgrade = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.programs.topgrade =
    { cfg, ... }:
    {
      inherit (cfg) enable;
    };
}
