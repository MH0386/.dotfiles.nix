{ delib, ... }:
delib.module {
  name = "gh";

  options.gh = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.gh = {
        inherit (cfg) enable;
      };
    };
}
