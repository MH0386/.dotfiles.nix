{ delib, ... }:
delib.module {
  name = "fastfetch";

  options.fastfetch = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.programs.fastfetch =
    { cfg, ... }:
    {
      inherit (cfg) enable;
    };
}
