{ delib, ... }:
delib.module {
  name = "autoUpgrade";

  options.autoUpgrade = with delib; {
    enable = boolOption true;
    allowReboot = boolOption true;
    dates = strOption "daily";
  };

  nixos.ifEnabled =
    { cfg, ... }:
    {
      system.autoUpgrade = { inherit (cfg) enable allowReboot dates; };
    };
}
