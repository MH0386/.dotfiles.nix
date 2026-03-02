{ delib, ... }:
delib.module {
  name = "yazi";

  options.yazi = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.programs.yazi =
    { cfg, ... }:
    {
      inherit (cfg) enable;
    };
}
