{ delib, pkgs, ... }:
delib.module {
  name = "trivy";

  options.trivy = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = [ pkgs.trivy ];
}
