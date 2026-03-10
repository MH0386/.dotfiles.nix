{ delib, ... }:
delib.module {
  name = "btop";

  options.btop = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.btop = {
        inherit (cfg) enable;
      };
    };
}
