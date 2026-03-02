{ delib, ... }:
delib.module {
  name = "fd";

  options.fd = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.programs.fd =
    { cfg, ... }:
    {
      inherit (cfg) enable;
    };
}
