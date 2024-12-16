{ ... }:
{
  networking = {
    # Define your hostname.
    hostName = "MohamedLaptopNixOS";
    # Enable networking
    networkmanager.enable = true;
    # Enables wireless support via wpa_supplicant.
    # networking.wireless.enable = true;
    # Open ports in the firewall.
    firewall = {
      allowedTCPPorts = [
        22
        80
        443
        8000
        8001
      ];
      # allowedUDPPorts = [ ... ];
    };
    # Configure network proxy if necessary
    # proxy = {
    #   default = "http://user:password@proxy:port/";
    #   noProxy = "127.0.0.1,localhost,internal.domain";
    # };
  };
}
