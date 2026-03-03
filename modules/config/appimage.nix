{ delib, ... }:
delib.module {
  name = "appimage";

  options.appimage = with delib; {
    enable = boolOption true;
    binfmt = boolOption true;
  };

  nixos.ifEnabled =
    { cfg, ... }:
    {
      programs.appimage = {
        inherit (cfg) enable;
        inherit (cfg) binfmt;
      };
    };
}
