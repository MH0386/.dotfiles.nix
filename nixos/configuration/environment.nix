{
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
      (with inputs; [
        zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
        # flox.packages.${system}.default
        fh.packages.${system}.default
        # nixos-conf-editor.packages.${system}.nixos-conf-editor
        # nix-software-center.packages.${system}.nix-software-center
      ])
      ++ (with pkgs; [
        atuin
        sbctl
        unzip
        zip
        wget
        nixfmt-rfc-style
        nixpkgs-fmt
        nixd
        nil
        lshw-gui
        lshw
        nvtopPackages.nvidia
        gnome-extensions-cli
        gnome-tweaks
        ntfs3g
        # qemu_kvm
        # qemu_full
        devenv
        nautilus
        nautilus-python
        gcc
        gnumake
        at-spi2-core.dev
        clang
        cmake
        dbus.dev
        gtk3
        gobject-introspection
        libdatrie
        libepoxy.dev
        libselinux
        libsepol
        libthai
        libxkbcommon
        ninja
        pcre
        pkg-config
        util-linux.dev
        xorg.libXdmcp
        xorg.libXtst
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
