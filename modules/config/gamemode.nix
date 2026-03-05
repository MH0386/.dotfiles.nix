{ delib, ... }:
delib.module {
  name = "gamemode";

  options.gamemode = with delib; {
    enable = boolOption true;
  };

  nixos.ifEnabled =
    { cfg, ... }:
    {
      programs.gamemode = { inherit (cfg) enable; };
    };
}
