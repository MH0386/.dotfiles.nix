{ delib, ... }:
delib.module {
  name = "keyring";

  options.keyring = with delib; {
    enableSeahorse = boolOption true;
    enableGnuPGAgent = boolOption true;
    enableGnomeKeyring = boolOption true;
  };

  nixos.ifEnabled =
    { cfg, ... }:
    {
      programs = {
        seahorse.enable = cfg.enableSeahorse;
        gnupg.agent = {
          enable = cfg.enableGnuPGAgent;
          enableSSHSupport = true;
        };
      };
      services.gnome.gnome-keyring.enable = cfg.enableGnomeKeyring;
    };

  home.ifEnabled =
    { cfg, ... }:
    {
      services.gpg-agent = {
        enable = cfg.enableGnuPGAgent;
        defaultCacheTtl = 1800;
        enableSshSupport = true;
      };
    };
}
