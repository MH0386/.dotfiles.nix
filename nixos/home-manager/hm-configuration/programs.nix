{ pkgs, pkgsStable, ... }:
{
  programs = {
    aria2 = {
      enable = true;
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
    bash.enable = true;
    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [
        batdiff
        batgrep
        batman
        batpipe
        batwatch
        prettybat
      ];
    };
    btop.enable = true;
    bun.enable = true;
    carapace = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
    };
    command-not-found.enable = true;
    dank-material-shell = import ./niri/dank-material-shell.nix { inherit pkgs; };
    direnv = {
      enable = true;
      nix-direnv.enable = true;
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
    fastfetch.enable = true;
    fd.enable = true;
    firefox = {
      enable = true;
      package = pkgsStable.firefox;
    };
    firefoxpwa = {
      enable = true;
      package = pkgsStable.firefoxpwa;
    };
    fzf = {
      enable = true;
    };
    gemini-cli = {
      enable = true;
    };
    gh.enable = true;
    ghostty = import ./ghostty/ghostty.nix { };
    git = {
      enable = true;
      package = pkgsStable.git;
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
    git-cliff = {
      enable = true;
    };
    gnome-shell = {
      enable = true;
      extensions = [
        { package = pkgs.gnomeExtensions.alphabetical-app-grid; }
        { package = pkgs.gnomeExtensions.appindicator; }
        { package = pkgs.gnomeExtensions.caffeine; }
        { package = pkgs.gnomeExtensions.clipboard-indicator; }
        { package = pkgs.gnomeExtensions.dash-to-dock; }
        { package = pkgs.gnomeExtensions.gtk4-desktop-icons-ng-ding; }
        {
          id = "system-monitor@gnome-shell-extensions.gcampax.github.com";
          package = pkgs.gnome-shell-extensions;
        }
        { package = pkgs.gnomeExtensions.vicinae; }
      ];
    };
    helix.enable = true;
    home-manager.enable = true;
    jq.enable = true;
    lapce.enable = true;
    lazydocker.enable = true;
    mcp = {
      enable = true;
      servers = {
        agno = {
          url = "https://docs.agno.com/mcp";
        };
        context7 = {
          url = "https://mcp.context7.com/mcp";
          headers = {
            CONTEXT7_API_KEY = "{env:CONTEXT7_API_KEY}";
          };
        };
        devenv = {
          command = "devenv";
          args = [
            "mcp"
          ];
        };
        github = {
          url = "https://api.githubcopilot.com/mcp";
        };
        git = {
          command = "uvx";
          args = [
            "mcp-server-git"
          ];
        };
        nixos = {
          command = "uvx";
          args = [ "mcp-nixos" ];
        };
        time = {
          command = "uvx";
          args = [
            "mcp-server-time"
          ];
        };
      };
    };
    niri = import ./niri/niri.nix { inherit pkgs; };
    nushell = {
      enable = true;
      plugins = with pkgs.nushellPlugins; [
        gstat
      ];
    };
    obs-studio = {
      enable = true;
      plugins = with pkgsStable.obs-studio-plugins; [
        obs-backgroundremoval
        obs-pipewire-audio-capture
      ];
    };
    opencode = {
      enable = true;
      enableMcpIntegration = true;
      settings = {
        plugin = [
          "micode"
          "oh-my-opencode"
          "opencode-daytona"
          "opencode-md-table-formatter"
          "opencode-notificator"
          "opencode-notifier"
          "opencode-skillful"
          "opencode-wakatime"
          "opencode-workspace"
          "opencode-worktree"
        ];
      };
    };
    pay-respects = {
      enable = true;
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
    ssh = {
      enable = true;
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
    };
    ty = {
      enable = true;
    };
    uv = {
      enable = true;
    };
    vesktop.enable = true;
    vicinae = {
      enable = true;
      systemd.enable = true;
    };
    vscode = {
      enable = true;
      package = pkgs.vscodium;
      profiles = {
        default = {
          enableMcpIntegration = true;
          # userSettings = {
          #   editor = {
          #     fontSize = 14;
          #     fontFamily = "Fira Code";
          #   };
          # };
        };
      };
    };
    yazi = {
      enable = true;
    };
    yt-dlp = {
      enable = true;
    };
    zed-editor = {
      enable = true;
      userSettings = {
        agent = {
          play_sound_when_agent_done = true;
          default_model = {
            provider = "copilot_chat";
            model = "gpt-5-mini";
          };
          model_parameters = [ ];
        };
        agent_servers = {
          github-copilot = {
            type = "registry";
          };
          junie-acp = {
            type = "registry";
          };
          kimi = {
            type = "registry";
          };
          opencode = {
            type = "registry";
          };
        };
        always_treat_brackets_as_autoclosed = true;
        buffer_font_size = 20.0;
        calls = {
          mute_on_join = true;
        };
        colorize_brackets = true;
        context_servers = {
          arch-ops-server = {
            enabled = false;
            settings = { };
          };
        };
        git = {
          inline_blame = {
            show_commit_summary = false;
          };
        };
        git_panel = {
          tree_view = true;
          sort_by_path = true;
        };
        inlay_hints = {
          enabled = true;
        };
        languages = {
          Nix = {
            formatter = {
              external = {
                command = "nixfmt";
              };
            };
          };
          Python = {
            language_servers = [
              "ty"
              "!basedpyright"
              "..."
            ];
          };
        };
        prettier = {
          allowed = true;
        };
        preview_tabs = {
          enable_preview_from_file_finder = true;
        };
        project_panel = {
          hide_hidden = false;
          hide_root = true;
          hide_gitignore = false;
        };
        restore_on_startup = "last_session";
        tabs = {
          show_diagnostics = "errors";
          file_icons = true;
          git_status = true;
        };
        terminal = {
          copy_on_select = true;
        };
        theme = "GitHub Dark";
        title_bar = {
          show_menus = false;
          show_branch_icon = true;
        };
        toolbar = {
          code_actions = true;
        };
        ui_font_size = 18.0;
        autosave = {
          after_delay = {
            milliseconds = 1000;
          };
        };
      };
      extensions = [
        "arch-mcp"
        "autocorrect"
        "basher"
        "caddyfile"
        "codeowners"
        "colored-zed-icons-theme"
        "csv"
        "desktop"
        "docker-compose"
        "dockerfile"
        "editorconfig"
        "fleet-themes"
        "ghostty"
        "git-firefly"
        "github-actions"
        "github-activity-summarizer"
        "github-dark-default"
        "github-theme"
        "html"
        "ini"
        "jq"
        "json5"
        "jsonl"
        "just"
        "log"
        "markdownlint"
        "mcp-server-brave-search"
        "mcp-server-byterover"
        "mcp-server-context7"
        "mcp-server-github"
        "mcp-server-sequential-thinking"
        "mcp-server-sonarqube"
        "nix"
        "nu"
        "pylsp"
        "pyrefly"
        "pytest-language-server"
        "python-requirements"
        "python-snippets"
        "rainbow-csv"
        "tombi"
        "toml"
        "wakatime"
      ];
    };
    zoxide.enable = true;
    zsh = {
      enable = true;
      autosuggestion.enable = true;
    };
  };
}
