{ delib, pkgsStable, ... }:
delib.module {
  name = "cuda";

  options.cuda = with delib; {
    enable = boolOption host.cudaFeatured;
  };

  nixos.ifEnabled = {
    nixpkgs.config.cudaSupport = true;
    environment = {
      systemPackages = with pkgsStable.cudaPackages; [
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
      ];
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
  };
}
