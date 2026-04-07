{
  den.default = {
    nixos = {
      networking = {
        # Enable networking
        networkmanager.enable = true;
        # Enables wireless support via wpa_supplicant.
        wireless.enable = true;
      };
      users.users.mohamed.extraGroups = [ "networkmanager" ];
    };
  };
}
