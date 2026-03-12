{
  den.schema.conf = {
    nixos = {
      hardware.enableAllFirmware = true;
      services.fwupd.enable = true;
    };
  };
}
