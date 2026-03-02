{ delib, ... }:
delib.module {
  name = "network";

  nixos.always.networking = {
    # Enable networking
    networkmanager.enable = true;
    # Enables wireless support via wpa_supplicant.
    wireless.enable = true;
  };
}
