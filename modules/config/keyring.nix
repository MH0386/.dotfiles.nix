{ delib, ... }:
delib.module {
  name = "keyring";

  options.keyring = with delib; {
    enableSeahorse = singleEnableOption true;
    enableGnuPGAgent = singleEnableOption true;
    enableGnomeKeyring = singleEnableOption true;
  };

  nixos.ifEnabled.programs =
    { cfg, ... }:
    {
      seahorse.enable = cfg.enableSeahorse;
      gnupg.agent = {
        enable = cfg.enableGnuPGAgent;
        enableSSHSupport = true;
      };
      services.gnome.gnome-keyring.enable = cfg.enableGnomeKeyring;
    };

  home.ifEnabled.services.gpg-agent =
    { cfg, ... }:
    {
      enable = cfg.enableGnuPGAgent;
      defaultCacheTtl = 1800;
      enableSshSupport = true;
    };
}
