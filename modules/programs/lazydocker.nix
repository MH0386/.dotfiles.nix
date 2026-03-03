{ delib, ... }:
delib.module {
  name = "lazydocker";

  options.lazydocker = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.lazydocker = {
        inherit (cfg) enable;
      };
    };
}
