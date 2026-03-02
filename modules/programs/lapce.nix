{ delib, ... }:
delib.module {
  name = "lapce";

  options.lapce = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.programs.lapce =
    { cfg, ... }:
    {
      inherit (cfg) enable;
    };
}
