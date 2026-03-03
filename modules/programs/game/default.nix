{ delib, ... }:
delib.module {
  name = "game";

  options.game = with delib; {
    gamemode.enable = boolOption true;
  };

  nixos.ifEnabled =
    { cfg, ... }:
    {
      programs.gamemode = {
        inherit (cfg.gamemode) enable;
      };
    };
}
