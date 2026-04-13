{
  den.default = {
    nixos =
      { lib, pkgs, ... }:
      {
        boot = {
          loader = {
            efi.canTouchEfiVariables = true;
            systemd-boot.enable = lib.mkForce false;
          };
          lanzaboote = {
            enable = true;
            pkiBundle = "/var/lib/sbctl";
          };
          kernelPackages = pkgs.linuxPackages_latest;
          initrd.systemd.enable = true;
          consoleLogLevel = 0;
          initrd.verbose = true;
          kernelParams = [
            "quiet"
            "splash"
            "rd.udev.log_level=3"
            "udev.log_priority=3"
            "boot.shell_on_fail"
          ];
        };
        environment.systemPackages = [ pkgs.sbctl ];
      };
  };
}
