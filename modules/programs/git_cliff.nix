{ delib, ... }:
delib.module {
  name = "git-cliff";

  options.git-cliff = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.programs.git-cliff =
    { cfg, ... }:
    {
      inherit (cfg) enable;
    };
}
