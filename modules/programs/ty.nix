{ delib, ... }:
delib.module {
  name = "ty";

  options.ty = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.programs.ty =
    { cfg, ... }:
    {
      inherit (cfg) enable;
    };
}
