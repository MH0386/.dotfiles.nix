{
  den.schema.conf = {
    nixos.system.autoUpgrade = {
      enable = true;
      allowReboot = true;
      dates = "daily";
    };
  };
}
