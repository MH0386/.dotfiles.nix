{ delib, ... }:
delib.module {
  name = "ruff";

  options.ruff = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.ruff = {
        inherit (cfg) enable;
      };
    };
}
