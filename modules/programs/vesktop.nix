{ delib, ... }:
delib.module {
  name = "vesktop";

  options.vesktop = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.programs.vesktop =
    { cfg, ... }:
    {
      inherit (cfg) enable;
    };
}
