{
  lib,
  pkgs,
  inputs,
  system,
  fh,
  pkgsStable,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./configuration/services.nix
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.mohamed = import ./home.nix;
    extraSpecialArgs = { };
    backupFileExtension =
      "backup-"
      + pkgs.lib.readFile "${pkgs.runCommand "timestamp" { } "echo -n `date '+%Y%m%d%H%M%S'` > $out"}";
  };

  hardware.enableAllFirmware = true;
  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mohamed = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Mohamed Hisham";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "render"
      "adbusers"
      "libvirtd"
      "podman"
      "flatpak"
    ];
  };

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
        wget
        nixfmt-rfc-style
        nixpkgs-fmt
        nixd
        gcc
        libgcc
        gnumake
        libtool
        #dbus
        packagekit
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
        fh.packages.${system}.default
        nixos-conf-editor.packages.${system}.nixos-conf-editor
        nix-software-center.packages.${system}.nix-software-center
        # inputs.zen-browser.packages.${system}.specific
        # cudaPackages.cudatoolkit
        # cudaPackages.nccl
        # cudaPackages.cudnn
        # cudaPackages.cuda_nvcc
      ]);
  };
}
