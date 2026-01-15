{ ... }:
{
  services = {
    gpg-agent = {
      enable = true;
      defaultCacheTtl = 1800;
      enableSshSupport = true;
    };
    ollama.enable = true;
    amberol.enable = true;
    #   kdeconnect = {
    #     enable = true;
    #     indicator = true;
    #   };
  };
}
