{ delib, ... }:
delib.module {
  name = "vicinae";

  options.vicinae = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.vicinae = {
        inherit (cfg) enable;
        systemd.enable = true;
      };
    };
}
