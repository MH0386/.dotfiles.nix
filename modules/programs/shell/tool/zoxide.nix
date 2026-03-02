{ delib, ... }:
delib.module {
  name = "zoxide";

  options.zoxide = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.programs.zoxide =
    { cfg, ... }:
    {
      inherit (cfg) enable;
    };
}
