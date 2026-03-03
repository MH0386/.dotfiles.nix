{ delib, ... }:
delib.module {
  name = "avahi";
  # Whether to run the Avahi daemon, which allows Avahi clients to use Avahi’s service discovery facilities and also allows the local machine to advertise its presence and services (through the mDNS responder implemented by avahi-daemon).

  options.avahi = with delib; {
    enable = boolOption true;
    publish.enable = boolOption true;
  };

  nixos.ifEnabled =
    { cfg, ... }:
    {
      services.avahi = {
        inherit (cfg) enable;
        publish.enable = cfg.publish.enable;
      };
    };
}
