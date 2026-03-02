{ delib, ... }:
delib.module {
  name = "fzf";

  options.fzf = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.programs.fzf =
    { cfg, ... }:
    {
      inherit (cfg) enable;
    };
}
