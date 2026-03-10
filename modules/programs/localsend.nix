{ delib, ... }:
delib.module {
  name = "localsend";

  options.localsend = with delib; {
    enable = boolOption true;
  };

  nixos.ifEnabled =
    { cfg, ... }:
    {
      programs.localsend = { inherit (cfg) enable; };
    };
}
