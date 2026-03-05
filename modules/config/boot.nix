{
  delib,
  lib,
  pkgs,
  inputs,
  ...
}:
delib.module {
  name = "boot";

  options =
    { cfg, ... }:
    {
      boot = with delib; {
        loader = enumOption [ "grub" "systemd-boot" "lanzaboote" ] (
          if cfg.mode == "uefi" then "lanzaboote" else "grub"
        );

        mode = enumOption [ "uefi" "legacy" ] (
          if builtins.pathExists /sys/firmware/efi/efivars then "uefi" else "legacy"
        );

        plymouth = {
          enable = boolOption true;
        };
      };
    };

  nixos.always =
    { cfg, ... }:
    {
      imports = [ inputs.lanzaboote.nixosModules.lanzaboote ];
      boot = {
        loader = {
          efi.canTouchEfiVariables = true;

          grub = lib.mkIf (cfg.loader == "grub") {
            enable = true;
            efiSupport = cfg.mode == "uefi";
            devices = [ "nodev" ];
            configurationLimit = 10;
          };

          systemd-boot = lib.mkMerge [
            { enable = lib.mkForce cfg.loader == "systemd-boot"; }
            (lib.mkIf (cfg.loader == "systemd-boot") {
              configurationLimit = 10;
              consoleMode = "max";
            })
          ];
        };

        lanzaboote = lib.mkIf (cfg.loader == "lanzaboote") {
          enable = true;
          pkiBundle = "/var/lib/sbctl";
        };
        kernelPackages = pkgs.linuxPackages_latest;
        initrd.systemd.enable = true;
        consoleLogLevel = 0;
        initrd.verbose = false;
        plymouth = {
          inherit (cfg.plymouth) enable;
          logo = "${pkgs.nixos-icons}/share/icons/hicolor/256x256/apps/nix-snowflake-white.png";
          theme = "breeze";
        };
        kernelParams = [
          "quiet"
          "splash"
          "rd.udev.log_level=3"
          "udev.log_priority=3"
          "boot.shell_on_fail"
        ];
      };
      environment.systemPackages = lib.mkIf (cfg.loader == "lanzaboote") [ pkgs.sbctl ];
    };
}
