{ delib, ... }:
delib.module {
  name = "btop";

  options.btop = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.programs.btop =
    { cfg, ... }:
    {
      inherit (cfg) enable;
    };
}
