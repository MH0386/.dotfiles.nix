{ delib, ... }:
delib.module {
  name = "flatpak";

  home.always.services.flatpak = {
    enable = true;
    uninstallUnmanaged = true;
    update.onActivation = true;
  };
  nixos.always.services.flatpak.enable = true;
}
