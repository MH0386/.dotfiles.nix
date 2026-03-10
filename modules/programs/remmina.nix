{ delib, pkgs, ... }:
delib.module {
  name = "remmina";

  options.remmina = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.remmina ];
}
