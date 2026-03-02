{ delib, pkgs, ... }:
delib.module {
  name = "httpie";

  options.httpie = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = with pkgs; [
    httpie
    httpie-desktop
  ];
}
