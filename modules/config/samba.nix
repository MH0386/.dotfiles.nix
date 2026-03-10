{ delib, ... }:
delib.module {
  name = "samba";

  options.samba = with delib; {
    enable = boolOption true;
  };

  nixos.ifEnabled =
    { cfg, ... }:
    {
      services.samba = {
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
    };
}
