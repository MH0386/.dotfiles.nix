{ pkgs, ... }:
{
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
    nushell = {
      enable = true;
      plugins = with pkgs.nushellPlugins; [
        gstat
      ];
    };
    pay-respects = {
      enable = true;
    };
    lazydocker.enable = true;
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
      profiles = {
        default = {
          enableMcpIntegration = true;
          # userSettings = {
          #   editor = {
          #     fontSize = 14;
          #     fontFamily = "Fira Code";
          #   };
          # };
          userMcp = {
            servers = {
              Github = {
                url = "https://api.githubcopilot.com/mcp";
              };
              Agno = {
                url = "https://docs.agno.com/mcp";
              };
            };
          };
        };
      };
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
    mcp = {
      enable = true;
      servers = {
        fetch = {
          command = "npx";
          args = [
            "mcp-server-fetch"
          ];
        };
        git = {
          command = "uvx";
          args = [
            "mcp-server-git"
          ];
        };
        time = {
          command = "uvx";
          args = [
            "mcp-server-time"
          ];
        };
        context7 = {
          url = "https://mcp.context7.com/mcp";
          headers = {
            CONTEXT7_API_KEY = "{env:CONTEXT7_API_KEY}";
          };
        };
      };
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
        "autocorrect"
        "caddyfile"
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
          id = "system-monitor@gnome-shell-extensions.gcampax.github.com";
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
}
