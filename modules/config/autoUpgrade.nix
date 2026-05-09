{
  den.default = {
    nixos.system.autoUpgrade = {
      enable = true;
      allowReboot = true;
      dates = "daily";
    };
  };
}
