{ delib, ... }:
delib.module {
  name = "helix";

  options.helix = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.programs.helix =
    { cfg, ... }:
    {
      inherit (cfg) enable;
    };
}
