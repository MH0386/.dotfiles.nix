{
  delib,
  pkgs,
  config,
  lib,
  ...
}:
delib.module {
  name = "nvidia";

  options.nvidia = with delib; {
    enable = boolOption host.nvidiaFeatured;
    open = boolOption false;
    nvidiaSettings = boolOption true;
    powerManagement = {
      enable = boolOption false;
      finegrained = boolOption false;
    };
    modesetting.enable = boolOption true;
  };

  nixos.ifEnabled =
    { cfg, ... }:
    {
      hardware.nvidia = {
        # Use the NVidia open source kernel module (not to be confused with the independent third-party "nouveau" open source driver).
        # Support is limited to the Turing and later architectures. Full list of supported GPUs is at:
        # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
        # Only available from driver 515.43.04+
        # Currently alpha-quality/buggy, so false is currently the recommended setting.
        inherit (cfg.nvidia) open; # Proprietary for full CUDA
        # Enable the Nvidia settings menu,
        # accessible via `nvidia-settings`.
        inherit (cfg.nvidia) nvidiaSettings;
        # Optionally, you may need to select the appropriate driver version for your specific GPU.
        package = config.boot.kernelPackages.nvidiaPackages.stable;
        # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
        powerManagement = {
          # Enable this if you have graphical corruption issues or application crashes after waking
          # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead
          # of just the bare essentials.
          inherit (cfg.nvidia.powerManagement) enable;
          # Fine-grained power management. Turns off GPU when not in use.
          # Experimental and only works on modern Nvidia GPUs (Turing or newer).
          inherit (cfg.nvidia.powerManagement) finegrained;
        };
        # Modesetting is required.
        modesetting.enable = cfg.nvidia.modesetting.enable;
      };
      # Load nvidia driver for Xorg and Wayland
      services.xserver.videoDrivers = lib.mkIf cfg.nvidia.enable [ "nvidia" ];
      environment.systemPackages = with pkgs; [
        nvitop
        gpu-viewer
        nvtopPackages.nvidia
      ];
    };
}
