{ delib, pkgs, ... }:
delib.module {
  name = "remmina";

  options.remmina = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.remmina ];
}
