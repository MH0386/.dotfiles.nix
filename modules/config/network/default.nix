{ delib, host, ... }:
delib.module {
  name = "network";

  nixos.always =
    { myconfig, ... }:
    let
      inherit (myconfig.constants) username;
    in
    {
      networking = {
        hostName = host.name;
        # Enable networking
        networkmanager.enable = true;
        # Enables wireless support via wpa_supplicant.
        wireless.enable = true;
      };
      users.users.${username}.extraGroups = [ "networkmanager" ];

    };
}
