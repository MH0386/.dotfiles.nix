{ delib, ... }:
delib.module {
  name = "zoxide";

  options.zoxide = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.zoxide = {
        inherit (cfg) enable;
      };
    };
}
