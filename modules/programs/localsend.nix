{ delib, ... }:
delib.module {
  name = "localsend";

  options.localsend = with delib; {
    enable = singleEnableOption true;
  };

  nixos.ifEnabled.programs.localsend =
    { cfg, ... }:
    {
      inherit (cfg) enable;
    };
}
