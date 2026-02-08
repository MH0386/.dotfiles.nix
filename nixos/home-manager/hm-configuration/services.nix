_: {
  services = {
    gpg-agent = {
      enable = true;
      defaultCacheTtl = 1800;
      enableSshSupport = true;
    };
    amberol.enable = true;
    #   kdeconnect = {
    #     enable = true;
    #     indicator = true;
    #   };
  };
}
