{ delib, ... }:
delib.module {
  name = "command-not-found";

  options.command-not-found = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.programs.command-not-found =
    { cfg, ... }:
    {
      inherit (cfg) enable;
    };
}
