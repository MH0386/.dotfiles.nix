{ delib, pkgs, ... }:
delib.module {
  name = "pre-commit";

  options.pre-commit = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.pre-commit ];
}
