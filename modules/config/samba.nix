{ delib, ... }:
delib.module {
  name = "samba";

  options.samba = with delib; {
    enable = boolOption host.sambaFeatured;
  };

  nixos.ifEnabled.services.samba =
    { cfg, ... }:
    {
      inherit (cfg) enable;
      openFirewall = true;
      settings = {
        public = {
          browseable = "yes";
          comment = "Public samba share.";
          writable = "yes";
          "guest ok" = "yes";
        };
      };
    };
}
