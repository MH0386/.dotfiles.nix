{
  den.schema.conf = {
    nixos.services.samba = {
      enable = true;
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
