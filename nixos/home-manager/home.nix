{
  config,
  pkgs,
  lib,
  ...
}:
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

  services = {
    gpg-agent = {
      enable = true;
      defaultCacheTtl = 1800;
      enableSshSupport = true;
    };
    #   kdeconnect = {
    #     enable = true;
    #     indicator = true;
    #   };
  };

  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      settings = {
        user = {
          name = "Mohamed Hisham Abdelzaher";
          email = "mohamed.hisham.abdelzaher@gmail.com";
        };
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
    zoxide.enable = true;
    bash.enable = true;
    gh.enable = true;
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

  home = {
    file = {
      ".config/niri/config.kdl".source = ./dotfiles/tiling-window-manager/niri/config.kdl;
    };
    shellAliases = {
      ll = "ls -l";
      la = "ls -la";
      l = "ls";
      c = "clear";
      h = "history";
    };
    packages =
      (with pkgs.gnomeExtensions; [
        timer
        wiggle
        appindicator
        caffeine
        clipboard-indicator
        dash-to-dock
        gtk4-desktop-icons-ng-ding
      ])
      ++ (with pkgs; [
        prek
        pre-commit
        uv
        ffmpeg
        clapper
        vlc
        act
        jetbrains.pycharm
        spacedrive
        zed-editor
        httpie
        httpie-desktop
        podman-desktop
        termius
        remmina
        kubectl
        kubernetes
        kompose
        warp-terminal
        gnome-boxes
        shotwell
        gnome-contacts
        bitwarden-cli
        bitwarden-desktop
        gimp-with-plugins
        beeper
        ghostty
        yq-go
        rustup
        gtk3
        glib
        rustup
        rustscan
        gitbutler
      ]);
    sessionPath = [
      "${config.home.homeDirectory}/.cargo/bin"
    ];
    sessionVariables = { };
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
    stateVersion = "26.05";
  };
}
