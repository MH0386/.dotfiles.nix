{
  pkgs,
  pkgsStable,
  inputs,
  ...
}:
{
  environment = {
    localBinInPath = true;
    homeBinInPath = true;
    systemPackages =
      (with inputs; [
        zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
        # flox.packages.${system}.default
        # fh.packages.${system}.default
        # nixos-conf-editor.packages.${system}.nixos-conf-editor
        # nix-software-center.packages.${system}.nix-software-center
      ])
      ++ (with pkgs; [
        ignition
        nvitop
        gpu-viewer
        sbctl
        unzip
        zip
        wget
        lshw-gui
        nvtopPackages.nvidia
        gnome-extensions-cli
        gnome-tweaks
        ntfs3g
        nautilus-python
        gcc
        clang
        cmake
        glib
        gnome-extension-manager

        # Additional CUDA development tools
        # python3Packages.torch
        # python3Packages.tensorflow
        # python3Packages.cupy
      ])
      ++ (with pkgsStable; [
        fh
        cudaPackages.nccl
        cudaPackages.cudnn
        cudaPackages.cudatoolkit
        cudaPackages.cuda_nvcc
        cudaPackages.cuda_cudart
        cudaPackages.cuda_cccl
        cudaPackages.cuda_cupti
        cudaPackages.cuda_gdb
        cudaPackages.cuda_nvprof
        cudaPackages.cuda_nsight
      ]);
    # CUDA environment variables
    sessionVariables = {
      CUDA_PATH = "${pkgs.cudatoolkit}";
      LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
        pkgs.linuxPackages.nvidia_x11
        pkgs.ncurses5
        pkgs.stdenv.cc.cc.lib
        pkgs.zlib
        pkgs.libGL
        pkgs.glib
        pkgs.gtk3
        pkgs.libGLU
      ];
      EXTRA_LDFLAGS = "-L/lib -L${pkgs.linuxPackages.nvidia_x11}/lib";
      EXTRA_CCFLAGS = "-I/usr/include";
    };
  };
}
