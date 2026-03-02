{ delib, ... }:
delib.module {
  name = "pay-respects";

  options.pay-respects = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.programs.pay-respects =
    { cfg, ... }:
    {
      inherit (cfg) enable;
    };
}
