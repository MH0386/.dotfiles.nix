{ delib, ... }:
delib.module {
  name = "appimage";

  options.appimage = with delib; {
    enable = boolOption true;
    binfmt = boolOption true;
  };

  nixos.ifEnabled.programs.appimage =
    { cfg, ... }:
    {
      inherit (cfg) enable;
      inherit (cfg) binfmt;
    };
}
