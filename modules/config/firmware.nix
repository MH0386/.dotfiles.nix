{
  den.default = {
    nixos = {
      hardware.enableAllFirmware = true;
      services.fwupd.enable = true;
    };
  };
}
