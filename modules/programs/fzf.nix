{ delib, ... }:
delib.module {
  name = "fzf";

  options.fzf = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.fzf = {
        inherit (cfg) enable;
      };
    };
}
