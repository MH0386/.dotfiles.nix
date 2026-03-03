{ delib, ... }:
delib.module {
  name = "aria2";

  options.aria2 = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.aria2 = {
        inherit (cfg) enable;
      };
    };
}
