{
  den.schema.conf = {
    nixos = {
      networking = {
        # Enable networking
        networkmanager.enable = true;
        # Enables wireless support via wpa_supplicant.
        wireless.enable = true;
      };
      users.users.mohamed.extraGroups = [ "networkmanager" ];
    };

    provides = {
      avahi = {
        # Whether to run the Avahi daemon, which allows Avahi clients to use Avahi’s service discovery facilities and also allows the local machine to advertise its presence and services (through the mDNS responder implemented by avahi-daemon).
        nixos.services.avahi = {
          enable = true;
          publish.enable = true;
        };
      };
      firewall = {
        # Open ports in the firewall.
        nixos.networking.firewall = {
          enable = true;
          allowedTCPPorts = [
            22
            80
            443
            8000
            8001
          ];
        };
      };
      ssh = {
        # Enable the OpenSSH daemon.
        nixos.services.openssh.enable = true;
        homeManager.programs.ssh.enable = true;
      };
      vnstat = {
        # Whether to enable update of network usage statistics via vnstatd.
        nixos.services.vnstat.enable = true;
      };
    };
  };
}
