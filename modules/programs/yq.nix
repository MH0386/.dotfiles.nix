{ delib, pkgs, ... }:
delib.module {
  name = "yq";

  options.yq = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.yq-go ];
}
