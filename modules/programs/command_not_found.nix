{ delib, ... }:
delib.module {
  name = "command-not-found";

  options.command-not-found = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.command-not-found = {
        inherit (cfg) enable;
      };
    };
}
