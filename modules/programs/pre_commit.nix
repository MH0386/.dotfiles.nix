{ delib, pkgs, ... }:
delib.module {
  name = "pre-commit";

  options.pre-commit = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.pre-commit ];
}
