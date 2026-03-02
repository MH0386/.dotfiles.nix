{ delib, ... }:
delib.module {
  name = "steam";

  options.steam = with delib; {
    enable = boolOption host.gameFeatured;
  };

  nixos.ifEnabled.programs.steam =
    { cfg, ... }:
    {
      inherit (cfg) enable;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
}
