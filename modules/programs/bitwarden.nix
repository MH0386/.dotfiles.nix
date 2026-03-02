{ delib, pkgs, ... }:
delib.module {
  name = "bitwarden";

  options.bitwarden = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = with pkgs; [
    bitwarden-cli
    bitwarden-desktop
  ];
}
