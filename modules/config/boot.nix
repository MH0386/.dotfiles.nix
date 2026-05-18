{ inputs, ... }:
{
  den.default = {
    nixos =
      { pkgs, ... }:
      {
        boot = {
          loader = {
            efi.canTouchEfiVariables = true;
            systemd-boot = {
              enable = true;
              memtest86.enable = true;
            };
          };
          kernelPackages = pkgs.linuxPackages_latest;
          kernelParams = [ "boot.shell_on_fail" ];
        };
      };
  };
  den.aspects = {
    MohamedDesktopNixOS = {
      nixos.boot.blacklistedKernelModules = [ "nouveau" ];
    };
    MohamedLaptopNixOS = {
      nixos =
        { pkgs, lib, ... }:
        {
          imports = [ inputs.lanzaboote.nixosModules.lanzaboote ];
          boot = {
            lanzaboote = {
              enable = true;
              pkiBundle = "/var/lib/sbctl";
            };
            loader.systemd-boot.enable = lib.mkForce false;
            blacklistedKernelModules = [
              "nouveau"
              "nvidia_drm"
              "nvidia_modeset"
              "nvidia"
            ];
          };
          environment.systemPackages = [ pkgs.sbctl ];
        };
    };
  };
}
