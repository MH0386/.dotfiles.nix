{ delib, ... }:
delib.module {
  name = "steam";

  options.steam = with delib; {
    enable = boolOption true;
  };

  nixos.ifEnabled =
    { cfg, ... }:
    {
      programs.steam = {
        inherit (cfg) enable;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
      };
    };
}
