{ delib, pkgs, ... }:
delib.module {
  name = "proton";

  options.proton = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = with pkgs; [
    proton-pass
    proton-authenticator
  ];
}
