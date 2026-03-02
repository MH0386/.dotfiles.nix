{ delib, pkgs, ... }:
delib.module {
  name = "kubernetes";

  options.kubernetes = with delib; {
    enable = singleEnableOption true;
  };

  home.ifEnabled.home.packages = with pkgs; [
    kubernetes
    kubectl
    kompose
  ];
}
