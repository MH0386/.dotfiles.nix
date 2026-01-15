{ config, pkgs, ... }:
{
  imports = [ ];

  xdg = {
    mimeApps = {
      defaultApplications = {
        "x-scheme-handler/http" = "zen.desktop";
        "x-scheme-handler/https" = "zen.desktop";
        "x-scheme-handler/chrome" = "zen.desktop";
        "text/html" = "zen.desktop";
        "application/x-extension-htm" = "zen.desktop";
        "application/x-extension-html" = "zen.desktop";
        "application/x-extension-shtml" = "zen.desktop";
        "application/xhtml+xml" = "zen.desktop";
        "application/x-extension-xhtml" = "zen.desktop";
        "application/x-extension-xht" = "zen.desktop";
      };
      associations.added = {
        "x-scheme-handler/http" = [ "zen.desktop" ];
        "x-scheme-handler/https" = [ "zen.desktop" ];
        "x-scheme-handler/chrome" = [ "zen.desktop" ];
      };
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface".color-scheme = "prefer-dark";
    "org/gnome/desktop/default-applications".terminal = "ghostty.desktop";
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
      ];
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "Launch Terminal";
      command = "ghostty";
      binding = "<Super>t";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      name = "Launch Vicinae";
      command = "vicinae toggle";
      binding = "<Alt>space";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
      name = "Launch Clipboard History";
      command = "vicinae deeplink vicinae://extensions/vicinae/clipboard/history";
      binding = "<Super>v";
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
    cursorTheme = {
      name = "WhiteSur-cursors";
      package = pkgs.whitesur-cursors;
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
    ollama.enable = true;
    amberol.enable = true;
    #   kdeconnect = {
    #     enable = true;
    #     indicator = true;
    #   };
  };

  programs = {
    home-manager.enable = true;
    ghostty = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
      installBatSyntax = true;
      settings = {
        theme = "GitHub Dark";
        font-size = 12;
        font-family-bold = "JetBrains Mono Bold";
        font-family = "JetBrains Mono";
        font-feature = "liga";
        window-decoration = "auto";
        window-padding-x = 12;
        window-padding-y = 12;
        window-padding-balance = true;
        background-opacity = 1.0;
        background-blur-radius = 32;
        window-save-state = "always";
        cursor-style = "block";
        cursor-style-blink = true;
        mouse-hide-while-typing = true;
        copy-on-select = true;
        confirm-close-surface = false;
        focus-follows-mouse = true;
        keybind = [
          "ctrl+c=copy_to_clipboard"
          "ctrl+v=paste_from_clipboard"
          "ctrl+shift+n=new_window"
          "ctrl+t=new_tab"
          "ctrl+plus=increase_font_size:1"
          "ctrl+minus=decrease_font_size:1"
          "ctrl+zero=reset_font_size"
          "shift+enter=text:\n"
        ];
        unfocused-split-opacity = 0.7;
        unfocused-split-fill = "#44464f";
        adw-toolbar-style = "flat";
        gtk-titlebar = true;
        shell-integration = "detect";
        shell-integration-features = "cursor,sudo,title,no-cursor";
        gtk-single-instance = true;
        config-file = "./config-dankcolors";
      };
    };
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
    atuin = {
      enable = true;
      daemon.enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
      enableZshIntegration = true;
      settings = {
        style = "auto";
      };
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
        format = "$all";
      };
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
    };
    topgrade = {
      enable = true;
      settings = {
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
    vicinae = {
      enable = true;
      systemd.enable = true;
    };
    eza = {
      enable = true;
      colors = "always";
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
      git = true;
      icons = "always";
    };
    carapace = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
    };
    gemini-cli = {
      enable = true;
    };
    opencode = {
      enable = true;
      enableMcpIntegration = true;
    };
    zed-editor = {
      enable = true;
      extensions = [
        "html"
        "toml"
        "dockerfile"
        "git-firefly"
        "github-theme"
        "log"
        "docker-compose"
        "csv"
        "github-dark-default"
        "rainbow-csv"
        "pylsp"
        "fleet-themes"
        "mcp-server-context7"
        "basher"
        "colored-zed-icons-theme"
        "mcp-server-github"
        "python-requirements"
        "wakatime"
        "mcp-server-sequential-thinking"
        "python-snippets"
        "cspell"
        "autocorrect"
        "caddyfile"
        "code-stats"
        "json5"
        "tombi"
        "github-activity-summarizer"
        "mcp-server-byterover"
        "markdownlint"
        "github-actions"
        "jq"
        "jsonl"
        "desktop"
        "mcp-server-sonarqube"
        "opencode"
        "arch-mcp"
        "nix"
        "ini"
        "nu"
        "codeowners"
        "editorconfig"
        "ghostty"
        "pyrefly"
        "pytest-language-server"
        "mcp-server-brave-search"
      ];
    };
    uv = {
      enable = true;
    };
    element-desktop.enable = true;
    cargo = {
      enable = true;
      settings = {
        term = {
          color = "auto";
          hyperlinks = true;
        };
      };
    };
    gnome-shell = {
      enable = true;
      extensions = [
        { package = pkgs.gnomeExtensions.dash-to-dock; }
        { package = pkgs.gnomeExtensions.vicinae; }
        { package = pkgs.gnomeExtensions.appindicator; }
        { package = pkgs.gnomeExtensions.caffeine; }
        { package = pkgs.gnomeExtensions.clipboard-indicator; }
        { package = pkgs.gnomeExtensions.gtk4-desktop-icons-ng-ding; }
        {
          id = "6807";
          package = pkgs.gnome-shell-extensions;
        }
      ];
    };
    git-cliff = {
      enable = true;
    };
    jq.enable = true;
    yazi = {
      enable = true;
    };
    obs-studio = {
      enable = true;
      plugins = with pkgs; [
        obs-studio-plugins.obs-pipewire-audio-capture
        obs-studio-plugins.obs-backgroundremoval
      ];
    };
  };

  home = {
    pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      package = pkgs.whitesur-cursors;
      name = "WhiteSur-cursors";
      size = 24;
    };
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
    packages = with pkgs; [
      nixfmt
      antigravity
      dioxus-cli
      newelle
      trivy
      upscaler
      upscayl
      doppler
      prek
      pre-commit
      ffmpeg
      clapper
      vlc
      act
      jetbrains.pycharm
      spacedrive
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
      yq-go
      rustup
      gtk3
      glib
      rustup
      rustscan
      gitbutler
      dconf-editor
      dialect
      mediawriter
    ];
    sessionPath = [    ];
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
