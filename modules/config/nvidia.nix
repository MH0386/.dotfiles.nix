{
  den = {
    default = {
      nixos =
        {
          pkgs,
          pkgsStable,
          config,
          ...
        }:
        {
          hardware.nvidia = {
            # Use the NVidia open source kernel module (not to be confused with the independent third-party "nouveau" open source driver).
            # Support is limited to the Turing and later architectures. Full list of supported GPUs is at:
            # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
            # Only available from driver 515.43.04+
            # Currently alpha-quality/buggy, so false is currently the recommended setting.
            open = false; # Proprietary for full CUDA
            # Enable the Nvidia settings menu,
            # accessible via `nvidia-settings`.
            nvidiaSettings = true;
            # Optionally, you may need to select the appropriate driver version for your specific GPU.
            package = config.boot.kernelPackages.nvidiaPackages.stable;
            # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
            powerManagement = {
              # Enable this if you have graphical corruption issues or application crashes after waking
              # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead
              # of just the bare essentials.
              enable = false;
              # Fine-grained power management. Turns off GPU when not in use.
              # Experimental and only works on modern Nvidia GPUs (Turing or newer).
              finegrained = false;
            };
            # Modesetting is required.
            modesetting.enable = true;
          };
          # Load nvidia driver for Xorg and Wayland
          services.xserver.videoDrivers = [ "nvidia" ];
          environment = {
            systemPackages =
              (with pkgs; [
                nvitop
                gpu-viewer
                nvtopPackages.nvidia
              ])
              ++ (with pkgsStable.cudaPackages; [
                nccl
                cudnn
                cudatoolkit
                cuda_nvcc
                cuda_cudart
                cuda_cccl
                cuda_cupti
                cuda_gdb
                cuda_nvprof
                cuda_nsight

                # Additional CUDA development tools
                # python3Packages.torch
                # python3Packages.tensorflow
                # python3Packages.cupy
              ]);
            # CUDA environment variables
            sessionVariables = {
              CUDA_PATH = "${pkgsStable.cudaPackages.cudatoolkit}";
              LD_LIBRARY_PATH = pkgsStable.lib.makeLibraryPath [
                pkgsStable.linuxPackages.nvidia_x11
                pkgsStable.ncurses5
                pkgsStable.stdenv.cc.cc.lib
                pkgsStable.zlib
                pkgsStable.libGL
                pkgsStable.glib
                pkgsStable.gtk3
                pkgsStable.libGLU
              ];
              EXTRA_LDFLAGS = "-L/lib -L${pkgsStable.linuxPackages.nvidia_x11}/lib";
              EXTRA_CCFLAGS = "-I/usr/include";
            };
          };
          nixpkgs.config.cudaSupport = true;
        };
    };
    aspects = {
      MohamedDesktopNixOS = {
        nixos.nixpkgs.config.cudaCapabilities = [ "8.0" ];
      };
      MohamedLaptopNixOS = {
        nixpkgs.config.cudaCapabilities = [ "7.5" ];
        hardware.nvidia.prime = {
          offload = {
            enable = true;
            enableOffloadCmd = true;
          };
          intelBusId = "PCI:0:2:0";
          nvidiaBusId = "PCI:1:0:0";
        };
      };
    };
  };
}
