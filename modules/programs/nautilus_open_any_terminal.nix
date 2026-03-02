{ delib, ... }:
delib.module {
  name = "nautilus-open-any-terminal";

  options.nautilus-open-any-terminal = with delib; {
    enable = singleEnableOption true;
  };

  nixos.ifEnabled.programs.nautilus-open-any-terminal =
    { cfg, ... }:
    {
      inherit (cfg) enable;
      terminal = "ghostty";
    };
}
