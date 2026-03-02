{ delib, pkgs, ... }:
delib.module {
  name = "pyrefly";

  options.pyrefly = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.pyrefly ];
}
