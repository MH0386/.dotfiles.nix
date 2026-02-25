{ pkgs, pkgsStable, ... }:
{
  programs = {
    home-manager.enable = true;
    niri = {
      enable = true;
      package = pkgs.niri;
    };
    dank-material-shell = {
      enable = true;

      niri = {
        enableKeybinds = true; # Sets static preset keybinds
        enableSpawn = true; # Auto-start DMS with niri, if enabled

        includes = {
          enable = true; # Enable config includes hack. Enabled by default.

          filesToInclude = [
            # Files under `$XDG_CONFIG_HOME/niri/dms` to be included into the new config
            "alttab" # Please note that niri will throw an error if any of these files are missing.
            "binds"
            "colors"
            "layout"
            "outputs"
          ];
        };
      };

      # Core features
      enableSystemMonitoring = true; # System monitoring widgets (dgop)
      enableVPN = true; # VPN management widget
      enableDynamicTheming = true; # Wallpaper-based theming (matugen)
      enableAudioWavelength = true; # Audio visualizer (cava)
      enableCalendarEvents = true; # Calendar integration (khal)
      enableClipboardPaste = true; # Pasting items from the clipboard (wtype)

      settings = {
        theme = "dark";
        dynamicTheming = true;
        use24HourClock = false;
        currentThemeName = "dynamic";
        animationSpeed = 2;
        appLauncherGridColumns = 4;
        appLauncherViewMode = "list";
        appPickerViewMode = "grid";
        appsDockActiveColorMode = "primary";
        appsDockColorizeActive = false;
        appsDockEnlargeOnHover = true;
        appsDockEnlargePercentage = 125;
        appsDockHideIndicators = false;
        appsDockIconSizePercentage = 100;
        audioVisualizerEnabled = true;
        audioWheelScrollAmount = 5;
        launcherLogoMode = "os";
        desktopClockEnabled = true;
        desktopClockHeight = 180;
        desktopClockShowAnalogNumbers = false;
        desktopClockShowAnalogSeconds = true;
        desktopClockShowDate = true;
        desktopClockStyle = "analog";
        enableFprint = true;
        gtkThemingEnabled = true;
        iconTheme = "System Default";
        lockScreenShowDate = true;
        lockScreenShowMediaPlayer = true;
        lockScreenShowPasswordField = true;
        lockScreenShowPowerActions = true;
        lockScreenShowProfileImage = true;
        lockScreenShowSystemIcons = true;
        lockScreenShowTime = true;
        loginctlLockIntegration = true;
        matugenScheme = "scheme-tonal-spot";
        matugenTemplateAlacritty = true;
        matugenTemplateDgop = true;
        matugenTemplateEmacs = true;
        matugenTemplateEquibop = true;
        matugenTemplateFirefox = true;
        matugenTemplateFoot = true;
        matugenTemplateGhostty = true;
        matugenTemplateGtk = true;
        matugenTemplateHyprland = true;
        matugenTemplateKcolorscheme = true;
        matugenTemplateKitty = true;
        matugenTemplateMangowc = true;
        matugenTemplateNeovim = true;
        matugenTemplateNiri = true;
        matugenTemplatePywalfox = true;
        matugenTemplateQt5ct = true;
        matugenTemplateQt6ct = true;
        matugenTemplateVesktop = true;
        matugenTemplateVscode = true;
        matugenTemplateWezterm = true;
        matugenTemplateZenBrowser = true;
        modalDarkenBackground = true;
        networkPreference = "auto";
        niriOutputSettings = {
          eDP-1 = {
            vrrOnDemand = true;
          };
        };
        notificationHistoryEnabled = true;
        notificationHistorySaveCritical = true;
        notificationHistorySaveLow = true;
        notificationHistorySaveNormal = true;
        osdAudioOutputEnabled = true;
        osdBrightnessEnabled = true;
        osdCapsLockEnabled = true;
        osdIdleInhibitorEnabled = true;
        osdMediaPlaybackEnabled = true;
        osdMediaVolumeEnabled = true;
        osdMicMuteEnabled = true;
        osdVolumeEnabled = true;
        showBattery = true;
        showCapsLockIndicator = true;
        showClipboard = true;
        showClock = true;
        showControlCenterButton = true;
        showCpuTemp = true;
        showCpuUsage = true;
        showDock = true;
        showFocusedWindow = true;
        showGpuTemp = true;
        showLauncherButton = true;
        showMemUsage = true;
        showMusic = true;
        showNotificationButton = true;
        showPrivacyButton = true;
        showSeconds = false;
        showSystemTray = true;
        showWeather = true;
        showWorkspaceApps = true;
        showWorkspaceSwitcher = true;
        soundNewNotification = true;
        soundPluggedIn = true;
        soundsEnabled = true;
        soundVolumeChanged = true;
        systemMonitorEnabled = true;
        systemMonitorShowCpu = true;
        systemMonitorShowCpuGraph = true;
        systemMonitorShowCpuTemp = true;
        systemMonitorShowDisk = true;
        systemMonitorShowGpuTemp = true;
        systemMonitorShowHeader = true;
        systemMonitorShowMemory = true;
        systemMonitorShowMemoryGraph = true;
        systemMonitorShowNetwork = true;
        systemMonitorShowNetworkGraph = true;
        systemMonitorShowTopProcesses = true;
        useAutoLocation = true;
        useSystemSoundTheme = true;
        wallpaperFillMode = "Fill";
        waveProgressEnabled = true;
        weatherEnabled = true;
        privacyShowCameraIcon = true;
        privacyShowMicIcon = true;
        privacyShowScreenShareIcon = true;
        powerActionConfirm = true;
        powerActionHoldDuration = 0.5;
        powerMenuActions = [
          "reboot"
          "logout"
          "poweroff"
          "lock"
          "suspend"
          "restart"
        ];
        powerMenuDefaultAction = "suspend";
        runDmsMatugenTemplates = true;
        dockLauncherEnabled = true;
        dankLauncherV2BorderColor = "primary";
        dankLauncherV2ShowFooter = true;
        dankLauncherV2UnloadOnClose = false;
        controlCenterShowAudioIcon = true;
        controlCenterShowAudioPercent = false;
        controlCenterShowBatteryIcon = false;
        controlCenterShowBluetoothIcon = true;
        controlCenterShowBrightnessIcon = false;
        controlCenterShowBrightnessPercent = false;
        controlCenterShowMicIcon = false;
        controlCenterShowMicPercent = false;
        controlCenterShowNetworkIcon = true;
        controlCenterShowPrinterIcon = true;
        controlCenterShowScreenSharingIcon = true;
        controlCenterShowVpnIcon = true;
        controlCenterTileColorMode = "primary";
        controlCenterWidgets = [
          {
            enabled = true;
            id = "volumeSlider";
            width = 50;
          }
          {
            enabled = true;
            id = "brightnessSlider";
            width = 50;
          }
          {
            enabled = true;
            id = "wifi";
            width = 50;
          }
          {
            enabled = true;
            id = "bluetooth";
            width = 50;
          }
          {
            enabled = true;
            id = "audioOutput";
            width = 50;
          }
          {
            enabled = true;
            id = "audioInput";
            width = 50;
          }
          {
            enabled = true;
            id = "nightMode";
            width = 50;
          }
          {
            enabled = true;
            id = "darkMode";
            width = 50;
          }
        ];
        cornerRadius = 12;
        barConfigs = [
          {
            autoHide = false;
            autoHideDelay = 250;
            borderColor = "surfaceText";
            borderEnabled = false;
            borderOpacity = 1;
            borderThickness = 1;
            bottomGap = 0;
            centerWidgets = [
              "music"
              "clock"
              "weather"
            ];
            clickThrough = false;
            enabled = true;
            fontScale = 1;
            gothCornerRadiusOverride = false;
            gothCornerRadiusValue = 12;
            gothCornersEnabled = false;
            id = "default";
            innerPadding = 4;
            leftWidgets = [
              "launcherButton"
              "workspaceSwitcher"
              "focusedWindow"
            ];
            name = "Main Bar";
            noBackground = false;
            openOnOverview = false;
            popupGapsAuto = true;
            popupGapsManual = 4;
            position = 0;
            rightWidgets = [
              {
                enabled = true;
                id = "network_speed_monitor";
              }
              {
                enabled = true;
                id = "systemTray";
              }
              {
                enabled = true;
                id = "clipboard";
              }
              {
                enabled = true;
                id = "cpuUsage";
              }
              {
                enabled = true;
                id = "memUsage";
                showSwap = true;
              }
              {
                enabled = true;
                id = "notificationButton";
              }
              {
                enabled = true;
                id = "battery";
              }
              {
                enabled = true;
                id = "controlCenterButton";
                showAudioPercent = false;
                showBatteryIcon = false;
                showBrightnessIcon = false;
                showMicIcon = false;
              }
            ];
            screenPreferences = [
              "all"
            ];
            showOnLastDisplay = true;
            spacing = 4;
            squareCorners = false;
            transparency = 1;
            visible = true;
            widgetOutlineEnabled = false;
            widgetTransparency = 1;
          }
        ];
      };

      session = {
        isLightMode = false;
      };

      clipboardSettings = {
        maxHistory = 25;
        maxEntrySize = 5242880;
        autoClearDays = 1;
        clearAtStartup = true;
        disabled = false;
        disableHistory = false;
        disablePersist = false;
      };

      # Auto-enabled when plugins have settings configured
      # managePluginSettings = true;

      plugins = {
        # Simply enable plugins by their ID (from the registry)
        # dankBatteryAlerts.enable = true;
        # dockerManager.enable = true;

        # Add plugin-specific settings
        # mediaPlayer = {
        #   enable = true;

        #   # You can only define settings here if using the home-manager module
        #   # settings = {
        #   #   preferredSource = "spotify";
        #   # };
        # };
      };
    };
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
    ty = {
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
        };
      };
    };
    lapce.enable = true;
    ssh = {
      enable = true;
    };
    vesktop.enable = true;
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
    bun.enable = true;
    opencode = {
      enable = true;
      enableMcpIntegration = true;
      settings = {
        plugin = [
          "opencode-daytona"
          "opencode-wakatime"
          "opencode-notificator"
          "opencode-notifier"
          "oh-my-opencode"
          "opencode-md-table-formatter"
          "opencode-skillful"
          "micode"
          "opencode-workspace"
          "opencode-worktree"
        ];
      };
    };
    mcp = {
      enable = true;
      servers = {
        nixos = {
          command = "uvx";
          args = [ "mcp-nixos" ];
        };
        github = {
          url = "https://api.githubcopilot.com/mcp";
        };
        agno = {
          url = "https://docs.agno.com/mcp";
        };
        devenv = {
          command = "devenv";
          args = [
            "mcp"
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
      userSettings = {
        agent_servers = {
          kimi = {
            type = "registry";
          };
          opencode = {
            type = "registry";
          };
          github-copilot = {
            type = "registry";
          };
          junie-acp = {
            type = "registry";
          };
        };
        ui_font_size = 18.0;
        buffer_font_size = 20.0;
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
        calls = {
          mute_on_join = true;
        };
        git = {
          inline_blame = {
            show_commit_summary = false;
          };
        };
        terminal = {
          copy_on_select = true;
        };
        git_panel = {
          tree_view = true;
          sort_by_path = true;
        };
        project_panel = {
          hide_hidden = false;
          hide_root = true;
          hide_gitignore = false;
        };
        preview_tabs = {
          enable_preview_from_file_finder = true;
        };
        tabs = {
          show_diagnostics = "errors";
          file_icons = true;
          git_status = true;
        };
        title_bar = {
          show_menus = false;
          show_branch_icon = true;
        };
        prettier = {
          allowed = true;
        };
        colorize_brackets = true;
        inlay_hints = {
          enabled = true;
        };
        always_treat_brackets_as_autoclosed = true;
        toolbar = {
          code_actions = true;
        };
        autosave = {
          after_delay = {
            milliseconds = 1000;
          };
        };
        restore_on_startup = "last_session";
        theme = "GitHub Dark";
        context_servers = {
          arch-ops-server = {
            enabled = false;
            settings = { };
          };
        };
        agent = {
          play_sound_when_agent_done = true;
          default_model = {
            provider = "copilot_chat";
            model = "gpt-5-mini";
          };
          model_parameters = [ ];
        };
      };
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
        "just"
      ];
    };
    uv = {
      enable = true;
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
        { package = pkgs.gnomeExtensions.alphabetical-app-grid; }
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
      plugins = with pkgsStable.obs-studio-plugins; [
        obs-pipewire-audio-capture
        obs-backgroundremoval
      ];
    };
    firefox = {
      enable = true;
      package = pkgsStable.firefox;
    };
    firefoxpwa = {
      enable = true;
      package = pkgsStable.firefoxpwa;
    };
    helix.enable = true;
  };
}
