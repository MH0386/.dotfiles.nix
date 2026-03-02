{ delib, ... }:
delib.module {
  name = "portainer";

  options.portainer = with delib; {
    enable = boolOption host.portainerFeatured;
    version = strOption "latest";
    openFirewall = boolOption true;
    port = portOption 9443;
  };

  nixos.ifEnabled.services.portainer =
    { cfg, ... }:
    {
      inherit (cfg) enable;
      inherit (cfg) version;
      inherit (cfg) openFirewall;
      inherit (cfg) port;
    };
}
