{ delib, ... }:
delib.module {
  name = "nautilus-open-any-terminal";

  options.nautilus-open-any-terminal = with delib; {
    enable = boolOption true;
  };

  nixos.ifEnabled =
    { cfg, ... }:
    {
      programs.nautilus-open-any-terminal = {
        inherit (cfg) enable;
        terminal = "ghostty";
      };
    };
}
