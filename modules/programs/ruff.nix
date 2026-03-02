{ delib, ... }:
delib.module {
  name = "ruff";

  options.ruff = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.programs.ruff =
    { cfg, ... }:
    {
      inherit (cfg) enable;
    };
}
