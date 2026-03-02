{ delib, ... }:
delib.module {
  name = "gh";

  options.gh = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.programs.gh =
    { cfg, ... }:
    {
      inherit (cfg) enable;
    };
}
