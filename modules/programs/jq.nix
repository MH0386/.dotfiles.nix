{ delib, ... }:
delib.module {
  name = "jq";

  options.jq = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.programs.jq =
    { cfg, ... }:
    {
      inherit (cfg) enable;
    };
}
