{ delib, pkgs, ... }:
delib.module {
  name = "kubernetes";

  options.kubernetes = with delib; {
    enable = boolOption true;
  };

  home.ifEnabled.home.packages = with pkgs; [
    kubernetes
    kubectl
    kompose
  ];
}
