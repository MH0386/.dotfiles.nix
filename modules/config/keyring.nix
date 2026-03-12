{
  den.schema.conf = {
    nixos = {
      programs = {
        seahorse.enable = true;
        gnupg.agent = {
          enable = true;
          enableSSHSupport = true;
        };
      };
      services.gnome.gnome-keyring.enable = true;
    };

    homeManager = {
      services.gpg-agent = {
        enable = true;
        defaultCacheTtl = 1800;
        enableSshSupport = true;
      };
    };
  };
}
