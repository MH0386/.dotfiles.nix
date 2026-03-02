{ delib, ... }:
delib.module {
  name = "avahi";
  # Whether to run the Avahi daemon, which allows Avahi clients to use Avahi’s service discovery facilities and also allows the local machine to advertise its presence and services (through the mDNS responder implemented by avahi-daemon).

  options.avahi = with delib; {
    enable = boolOption host.avahiFeatured;
    publish.enable = boolOption true;
  };

  nixos.ifEnabled.services.avahi =
    { cfg, ... }:
    {
      inherit (cfg) enable;
      publish.enable = cfg.publish.enable;
    };
}
