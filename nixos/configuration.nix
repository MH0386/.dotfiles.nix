{
  config,
  pkgs,
  inputs,
  system,
  ...
}:
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
    # intel and nouveau are blacklisted
    blacklistedKernelModules = [
      "nouveau"
      "nvidia_drm"
      "nvidia_modeset"
      "nvidia"

    ];
    # extraModulePackages = [ pkgs.linuxPackages.nvidia_x11 ];
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  networking = {
    # Define your hostname.
    hostName = "MohamedLaptopNixOS";
    # Enable networking
    networkmanager.enable = true;
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Set your time zone.
  time.timeZone = "Africa/Cairo";

  i18n = {
    extraLocaleSettings = {
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
    # Select internationalisation properties.
    defaultLocale = "en_US.UTF-8";
  };

  # services.displayManager.sddm.autoNumlock = false;

  services = {
    flatpak.enable = true;
    fwupd.enable = true;
    ollama = {
      enable = true;
      acceleration = "cuda";
    };
    # Enable the KDE Plasma Desktop Environment.
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
    desktopManager.plasma6.enable = true;
    xserver = {
      # Enable the X11 windowing system.
      enable = true;
      # Configure keymap in X11
      xkb.layout = "us";
      # Load nvidia driver for Xorg and Wayland
      videoDrivers = [ "nvidia" ];
    };
    # Enable CUPS to print documents.
    printing.enable = true;
  };

  # Enable the GNOME Desktop Environment.
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

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
    isNormalUser = true;
    description = "Mohamed";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "render"
    ];
  };

  #   # Enable automatic login for the user.
  #   services.displayManager.autoLogin.enable = true;
  #   services.xserver.displayManager.autoLogin.user = "mohamed";

  nixpkgs.config = {
    # Allow unfree packages
    allowUnfree = true;
  };
  #   environment.variables = {
  #     NIXPKGS_ALLOW_UNFREE = 1;
  #     CONDA_PREFIX = "~/.pixi/envs/default";
  #   };
  programs = {
    # Hyperland
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    kdeconnect.enable = true;
    java = {
      enable = true;
      package = pkgs.jdk17;
    };
    starship = {
      enable = true;
      settings = {
        add_newline = false;
        format = "$line_break
[┌───────────────────<](bold green) @ $all
[└─](bold green)$character";
      };
    };
    virt-manager.enable = true;
    thunderbird.enable = true;
    obs-studio = {
      enable = true;
      enableVirtualCamera = true;
      plugins = with pkgs; [
        obs-studio-plugins.obs-pipewire-audio-capture
        obs-studio-plugins.obs-backgroundremoval
      ];
    };
    localsend.enable = true;
    git = {
      enable = true;
      config = {
        user = {
          name = "Mohamed Hisham Abdelzaher";
          email = "mohamed.hisham.abdelzaher@gmail.com";
        };
        init = {
          defaultBranch = "main";
        };
        pull.rebase = false;
      };
    };
    appimage.enable = true;
    adb.enable = true;
    # for performance mode
    gamemode.enable = true;
    steam = {
      enable = true; # install steam
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };
    # coolercontrol.enable = true;
  };

  fonts.packages = with pkgs; [ monaspace ];
  console.packages = with pkgs; [ monaspace ];

  environment.systemPackages = [
    pkgs.google-chrome
    pkgs.vscode
    pkgs.topgrade
    pkgs.wget
    pkgs.clapper
    pkgs.nodejs_22
    pkgs.nixfmt-rfc-style
    pkgs.nixpkgs-fmt
    pkgs.nixd
    pkgs.uv
    pkgs.flutter
    pkgs.pixi
    pkgs.distrobox
    pkgs.sdkmanager
    pkgs.kompose
    pkgs.fastfetch
    pkgs.libgcc
    pkgs.gcc
    pkgs.gnumake
    pkgs.libtool
    pkgs.dbus
    pkgs.packagekit
    pkgs.lshw-gui
    pkgs.lshw
    pkgs.brave
    pkgs.spacedrive
    pkgs.zed-editor
    # pkgs.gitbutler
    pkgs.nvtopPackages.nvidia
    inputs.nixos-conf-editor.packages.${system}.nixos-conf-editor
    inputs.nix-software-center.packages.${system}.nix-software-center
    pkgs.linuxPackages.nvidia_x11
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

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Experimental = true;
        };
      };
    };
    nvidia-container-toolkit.enable = true;
    # Enable OpenGL , Nouveau
    opengl = {
      enable = true;
      # driSupport = true;
      driSupport32Bit = true;
    };
    nvidia = {
      # Use the NVidia open source kernel module (not to be confused with the independent third-party "nouveau" open source driver).
      # Support is limited to the Turing and later architectures. Full list of supported GPUs is at:
      # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
      # Only available from driver 515.43.04+
      # Currently alpha-quality/buggy, so false is currently the recommended setting.
      open = true;
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
      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
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
