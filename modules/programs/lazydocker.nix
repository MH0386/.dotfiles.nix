{ delib, ... }:
delib.module {
  name = "lazydocker";

  options.lazydocker = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.programs.lazydocker =
    { cfg, ... }:
    {
      inherit (cfg) enable;
    };
}
