{ delib, ... }:
delib.module {
  name = "ssh";

  options.ssh = with delib; {
    enable = boolOption true;
  };

  nixos.ifEnabled =
    { cfg, ... }:
    {
      services.openssh = {
        # Enable the OpenSSH daemon.
        inherit (cfg) enable;
      };
    };

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.ssh = {
        inherit (cfg) enable;
      };
    };
}
