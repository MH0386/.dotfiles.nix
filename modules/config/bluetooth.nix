{
  delib,
  host,
  ...
}:
delib.module {
  name = "bluetooth";

  options.bluetooth = with delib; {
    enable = boolOption true;
    enableMprisProxy = boolOption true;
  };

  # myconfig.ifEnabled.persist.directories = ["/var/lib/bluetooth"];

  nixos.ifEnabled = {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    # services.blueman.enable = true;
  };

  # home.ifEnabled =
  #   { cfg, ... }:
  #   {
  #     services.mpris-proxy.enable = cfg.enableMprisProxy;

  #     services.blueman-applet.enable = true;
  #   };
}
