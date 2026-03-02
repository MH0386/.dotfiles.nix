{ delib, ... }:
delib.module {
  name = "ssh";

  options.ssh = with delib; {
    enable = boolOption host.sshFeatured;
  };

  nixos.ifEnabled.services.openssh =
    { cfg, ... }:
    {
      # Enable the OpenSSH daemon.
      inherit (cfg) enable;
    };

  home.ifEnabled.programs.ssh =
    { cfg, ... }:
    {
      inherit (cfg) enable;
    };
}
