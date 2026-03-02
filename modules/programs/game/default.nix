{ delib, ... }:
delib.module {
  name = "game";

  options.game = with delib; {
    gamemode.enable = boolOption host.gameFeatured;
  };

  nixos.ifEnabled.programs.gamemode =
    { cfg, ... }:
    {
      inherit (cfg.gamemode) enable;
    };
}
