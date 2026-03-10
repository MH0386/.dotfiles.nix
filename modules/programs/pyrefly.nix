{ delib, pkgs, ... }:
delib.module {
  name = "pyrefly";

  options.pyrefly = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.pyrefly ];
}
