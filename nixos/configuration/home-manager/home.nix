{
  config,
  pkgs,
  lib,
  ...
}:
let 
  fvm = import ./../apps/fvm/fvm.nix { inherit pkgs lib builtins; };
in 
{
  imports = [ ];
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  # Wayland, X, etc. support for session vars
  # systemd.user.sessionVariables = config.home-manager.users.mohamed.home.sessionVariables;

  xdg = {
    enable = true;
    dataHome = "${config.home.homeDirectory}/.local/share";
    mime.enable = true;
    mimeApps = {
      enable = true;
      # defaultApplications = {
      #   "x-scheme-handler/terminal" = "org.gnome.Ptyxis.desktop";
      # };
    };
    portal = {
      enable = true;
      extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
      config.common.default = "gtk";
    };
  };

  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      userName = "Mohamed Hisham Abdelzaher";
      userEmail = "mohamed.hisham.abdelzaher@gmail.com";
      extraConfig = {
        pull.rebase = false;
        init.defaultBranch = "main";
        credential = {
          helper = "${pkgs.git.override { withLibsecret = true; }}/bin/git-credential-libsecret";
        };
      };
    };
    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [
        batdiff
        batman
        batgrep
        batwatch
        batpipe
        prettybat
      ];
    };
    btop.enable = true;
    command-not-found.enable = true;
    fastfetch.enable = true;
    fd.enable = true;
    zsh = {
      enable = true;
      autosuggestion.enable = true;
    };
    bash.enable = true;
    gh.enable = true;
    jq.enable = true;
    java = {
      enable = true;
      package = pkgs.jdk17;
    };
    ruff = {
      enable = true;
      settings = {
        line-length = 100;
        per-file-ignores = {
          "__init__.py" = [ "F401" ];
        };
        lint = {
          select = [
            "E4"
            "E7"
            "E9"
            "F"
          ];
          ignore = [ ];
        };
      };
    };
    starship = {
      enable = true;
      settings = {
        add_newline = false;
        format = lib.concatStrings [
          "[┌───────────────────<](bold green) @ $all $line_break"
          "[└─](bold green)$character"
        ];
        character = {
          success_symbol = "➜";
          error_symbol = "➜";
        };
      };
    };
    topgrade = {
      enable = true;
      settings = {
        misc = {
          assume_yes = true;
          disable = [
            "pixi"
            "uv"
          ];
          set_title = false;
          cleanup = true;
        };
        commands = {
          "Run garbage collection on Nix store" = "nix-collect-garbage";
        };
      };
    };
    yt-dlp = {
      enable = true;
    };
    aria2 = {
      enable = true;
    };
    vscode = {
      enable = true;
    };
    ssh = {
      enable = true;
    };
    fzf = {
      enable = true;
    };
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };

  # services = {
  #   kdeconnect = {
  #     enable = true;
  #     indicator = true;
  #   };
  # };

  home = {
    packages = with pkgs; [
      microsoft-edge
      # google-chrome
      ffmpeg
      # code-cursor
      clapper
      nodejs_22
      pixi
      vlc
      celeste
      distrobox
      autoflake
      fastlane
      act
      dart
      jetbrains.idea-ultimate
      jetbrains.pycharm-professional
      # android-studio-full
      # android-studio-tools
      android-studio
      audacity
      spacedrive
      zed-editor
      gearlever
      discord
      httpie
      httpie-desktop
      podman-compose
      podman-desktop
      termius
      remmina
      kubectl
      kubernetes
      kompose
      warp-terminal
      nextcloud-client
      gnome-boxes
      shotwell
      gnome-contacts
      bitwarden-cli
      bitwarden-desktop
      gimp-with-plugins
      firefoxpwa
      beeper
      ptyxis
      yq-go
      rustup
      sqlite
      sqlitestudio
      apksigner
      fvm
      # poetry
      # poetryPlugins.poetry-plugin-up
      # poetryPlugins.poetry-audit-plugin
      # poetryPlugins.poetry-plugin-export
      # poetryPlugins.poetry-plugin-poeblix
      # gitbutler
    ];
    sessionPath = [
      "${config.home.homeDirectory}/.pixi/envs/default/bin"
      "${config.home.homeDirectory}/Android/Sdk/platform-tools"
      "${config.home.homeDirectory}/Android/Sdk/tools/bin"
      "${config.home.homeDirectory}/Android/Sdk/cmdline-tools/latest/bin"
      "${config.home.homeDirectory}/Android/Sdk/emulator"
      "${config.home.homeDirectory}/Android/Sdk/emulator/bin64"
      "${config.home.homeDirectory}/.pub-cache/bin"
    ];
    sessionVariables = {
      ANDROID_HOME = "${config.home.homeDirectory}/Android/Sdk";
      # GSK_RENDERER = "ngl";
      CONDA_PREFIX = "${config.home.homeDirectory}/.pixi/envs/default";
      PIXI_IN_SHELL = "1";
      PIXI_PROJECT_NAME = "default";
      PIXI_PROJECT_ROOT = "${config.home.homeDirectory}";
      PIXI_PROJECT_MANIFEST = "${config.home.homeDirectory}/pixi.toml";
      CONDA_DEFAULT_ENV = "default";
      PIXI_ENVIRONMENT_NAME = "default";
      PIXI_ENVIRONMENT_PLATFORMS = "linux-64";
      PIXI_PROMPT = "(default) ";
      FVM_PRIVILEGED_ACCESS = "true";
    };
    # Home Manager needs a bit of information about you and the
    # paths it should manage.
    username = "mohamed";
    homeDirectory = "/home/mohamed";
    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "25.05";
  };
}
