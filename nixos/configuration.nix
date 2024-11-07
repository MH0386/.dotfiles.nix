# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
  inputs,
  system,
  ...
}:
# with lib;
# let
#   nixos-conf-editor = import (pkgs.fetchFromGitHub {
#     owner = "snowfallorg";
#     repo = "nixos-conf-editor";
#     rev = "0.1.2";
#     sha256 = "sha256-/ktLbmF1pU3vFHeGooDYswJipNE2YINm0WpF9Wd1gw8=";
#   }) { };
#   nix-software-center = import (pkgs.fetchFromGitHub {
#     owner = "snowfallorg";
#     repo = "nix-software-center";
#     rev = "0.1.2";
#     sha256 = "xiqF1mP8wFubdsAQ1BmfjzCgOD3YZf7EGWl9i69FTls=";
#   }) { };
# in
{
  nix.settings = {
    substituters = [ "https://cuda-maintainers.cachix.org" ];
    trusted-public-keys = [
      "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
    ];
    experimental-features = [
      "flakes"
      "nix-command"
    ];
  };
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
  networking.hostName = "MohamedLaptopNixOS"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Africa/Cairo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  #   services.displayManager.sddm.autoNumlock = false;
  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb.layout = "us";
  #   hardware.sane.enable = true; # Enable SANE scanning support.
  #   hardware.sane.extraBackends = [
  #     pkgs.hplip
  #     pkgs.hplipWithPlugin
  #   ];
  #   # Enable CUPS to print documents.
  services.printing.enable = true;
  #   services.printing.drivers = [
  #     pkgs.gutenprint
  #     pkgs.hplip
  #     pkgs.hplipWithPlugin
  #   ];
  #   services.printing = {
  #     listenAddresses = [ "*:631" ];
  #     allowFrom = [ "all" ];
  #     browsing = true;
  #     defaultShared = true;
  #     openFirewall = true;
  #   };

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
    isNormalUser = true;
    description = "Mohamed";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      kdePackages.kate
      thunderbird
    ];
  };

  #   # Enable automatic login for the user.
  #   services.displayManager.autoLogin.enable = true;
  #   services.xserver.displayManager.autoLogin.user = "mohamed";

  # Install firefox.
  # programs.firefox.enable = true;
  services.flatpak.enable = true;
  # Allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;
    # packageOverrides = pkgs: { unstable = import unstableTarball { config = config.nixpkgs.config; }; };
  };
  #   environment.variables = {
  #     NIXPKGS_ALLOW_UNFREE = 1;
  #     CONDA_PREFIX = "~/.pixi/envs/default";
  #   };
  programs.java = {
    enable = true;
    package = pkgs.jdk17;
  };
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = "[$username@$hostname $path]($symbol)";
    };
  };
  programs.virt-manager.enable = true;
  #   programs.thunderbird.enable = true;
  #   programs.obs-studio = {
  #     enable = true;
  #     enableVirtualCamera = true;
  #     plugins = with pkgs; [
  #       obs-studio-plugins.obs-pipewire-audio-capture
  #       obs-studio-plugins.obs-backgroundremoval
  #
  #     ];
  #   };
  services.fwupd.enable = true;
  #   programs.localsend.enable = true;
  programs.git = {
    enable = true;
    config = {
      user = {
        name = "Mohamed Hisham Abdelzaher";
        email = "mohamed.hisham.abdelzaher@gmail.com";
      };
      init = {
        defaultBranch = "main";
      };
    };
  };
  #   programs.file-roller.enable = true;
  #   programs.evince.enable = true;
  #   programs.coolercontrol.enable = true;
  #   programs.calls.enable = true;
  programs.appimage.enable = true;
  #   programs.adb.enable = true;
  #   programs.gamemode.enable = true; # for performance mode
  #   programs.steam = {
  #     enable = true; # install steam
  #     remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  #     dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  #   };
  #   services.ollama = {
  #     enable = true;
  #     acceleration = "cuda";
  #   };

  fonts.packages = with pkgs; [ monaspace ];
  console.packages = with pkgs; [ monaspace ];
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    pkgs.google-chrome
    pkgs.vscode
    pkgs.topgrade
    pkgs.wget
    #     gnome-tweaks
    #     gnome-themes-extra
    pkgs.nodejs_22
    pkgs.nixfmt-rfc-style
    pkgs.nixpkgs-fmt
    pkgs.nixd
    pkgs.uv
    pkgs.pixi
    #     flutter
    pkgs.distrobox
    #     vlc
    pkgs.sdkmanager
    pkgs.kompose
    pkgs.fastfetch
    pkgs.libgcc
    pkgs.gcc
    pkgs.gnumake
    pkgs.libtool
    pkgs.dbus
    pkgs.packagekit
    # nixos-conf-editor
    inputs.nix-software-center.packages.${system}.nix-software-center
    # cudaPackages.cudatoolkit
    # cudaPackages.nccl
    # cudaPackages.cudnn
    # cudaPackages.cuda_nvcc
  ];

  # Enable common container config files in /etc/containers
  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;
      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
      extraPackages = with pkgs; [
        podman-compose
        podman-tui
        podman
        podman-desktop
        pods
      ];
    };
  };
  # hardware.nvidia-container-toolkit.enable = true;
  # Enable OpenGL
  hardware.graphics.enable = true;
  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    # Modesetting is required.
    modesetting.enable = true;
    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead
    # of just the bare essentials.
    powerManagement.enable = true;
    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;
    # Use the NVidia open source kernel module (not to be confused with the independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of supported GPUs is at:
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
    # Only available from driver 515.43.04+
    # Currently alpha-quality/buggy, so false is currently the recommended setting.
    open = false;
    # Enable the Nvidia settings menu,
    # accessible via `nvidia-settings`.
    nvidiaSettings = true;
    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).

  system = {
    stateVersion = "24.05";
    autoUpgrade = {
      enable = true;
      allowReboot = true;
      channel = "https://channels.nixos.org/nixos-24.05";
    };
  };
}
