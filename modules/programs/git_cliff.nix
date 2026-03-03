{ delib, ... }:
delib.module {
  name = "git-cliff";

  options.git-cliff = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.git-cliff = {
        inherit (cfg) enable;
      };
    };
}
