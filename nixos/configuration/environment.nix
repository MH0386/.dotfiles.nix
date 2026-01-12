{
  pkgs,
  inputs,
  system,
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
        fh.packages.${system}.default
        # nixos-conf-editor.packages.${system}.nixos-conf-editor
        nix-software-center.packages.${system}.nix-software-center
      ])
      ++ (with pkgs; [
        nvitop
        gpu-viewer
        gdm-settings
        czkawka
        szyszka
        bottles
        livecaptions
        pods
        warehouse
        sbctl
        unzip
        zip
        wget
        nixpkgs-fmt
        nixd
        nil
        lshw-gui
        nvtopPackages.nvidia
        gnome-extensions-cli
        gnome-tweaks
        ntfs3g
        devenv
        nautilus-python
        gcc
        clang
        cmake
        glib
        gnome-extension-manager
        # cudatoolkit
        # cudaPackages.cudatoolkit
        # cudaPackages.nccl
        # cudaPackages.cudnn
        # cudaPackages.cuda_nvcc
      ]);
  };
}
