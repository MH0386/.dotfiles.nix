{
  lib,
  pkgs,
  inputs,
  system,
  ...
}:
{
  environment = {
    sessionVariables = {
      NAUTILUS_4_EXTENSION_DIR = lib.mkDefault "${pkgs.stablePackages.nautilus-python}/lib/nautilus/extensions-4";
    };
    pathsToLink = [
      "/share/xdg-desktop-portal"
      "/share/applications"
      "/share/nautilus-python/extensions"
    ];
    localBinInPath = true;
    homeBinInPath = true;
    systemPackages =
      (with pkgs; [
        unzip
        zip
        wget
        nixfmt-rfc-style
        nixpkgs-fmt
        nixd
        gcc
        gnumake
        cmakeWithGui
        ninja
        clang
        pkg-config
        gtk2
        gtk3
        gtk4
        lshw-gui
        lshw
        libsForQt5.full
        nvtopPackages.nvidia
        gnome-extensions-cli
        gnome-tweaks
        ntfs3g
        qemu_kvm
        qemu_full
        devenv
        nautilus
        nautilus-python
      ])
      ++ (with pkgs.stablePackages; [
        # gnome-extension-manager
      ])
      ++ (with pkgs.stablePackages.gst_all_1; [
        gstreamer
        gst-plugins-base
        gst-plugins-good
        gst-plugins-bad
        gst-plugins-ugly
        gst-libav
      ])
      ++ (with inputs; [
        # fh.packages.${system}.default
        # nixos-conf-editor.packages.${system}.nixos-conf-editor
        # nix-software-center.packages.${system}.nix-software-center
        # inputs.zen-browser.packages.${system}.specific
        # cudaPackages.cudatoolkit
        # cudaPackages.nccl
        # cudaPackages.cudnn
        # cudaPackages.cuda_nvcc
      ]);
  };
}
