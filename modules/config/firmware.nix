{
  delib,
  ...
}:
delib.module {
  name = "firmware";

  nixos.always = {
    hardware.enableAllFirmware = true;
    services.fwupd.enable = true;
  };
}
