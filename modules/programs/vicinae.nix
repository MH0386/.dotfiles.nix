{ delib, ... }:
delib.module {
  name = "vicinae";

  options.vicinae = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.programs.vicinae =
    { cfg, ... }:
    {
      inherit (cfg) enable;
      systemd.enable = true;
    };
}
