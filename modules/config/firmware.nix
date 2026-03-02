{
  delib,
  ...
}:
delib.module {
  name = "firmware";

  options.firmware = with delib; {
    all_firmware = boolOption true;
    fwupd.enable = boolOption true;
  };

  nixos.ifEnabled =
    { cfg, ... }:
    {
      hardware.enableAllFirmware = cfg.all_firmware;
      services.fwupd.enable = cfg.fwupd.enable;
    };
}
