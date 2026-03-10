{ delib, pkgs, ... }:
delib.module {
  name = "yq";

  options.yq = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.yq-go ];
}
