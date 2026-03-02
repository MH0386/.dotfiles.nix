{ delib, ... }:
delib.module {
  name = "aria2";

  options.aria2 = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.programs.aria2 =
    { cfg, ... }:
    {
      inherit (cfg) enable;
    };
}
