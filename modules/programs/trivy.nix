{ delib, pkgs, ... }:
delib.module {
  name = "trivy";

  options.trivy = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.trivy ];
}
