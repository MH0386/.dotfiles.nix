{ inputs, ... }:
{
  den.provides = {
    dankMaterialShell = {
      homeManager = {
        imports = [
          inputs.dms.homeModules.dank-material-shell
          inputs.dms.homeModules.niri
          inputs.dms-plugin-registry.modules.default
        ];
        programs.dank-material-shell = {
          enable = true;

          systemd = {
            enable = true; # Systemd service for auto-start
            restartIfChanged = true; # Auto-restart dms.service when dank-material-shell changes
          };

          niri = {
            includes.filesToInclude = [
              # Files under `$XDG_CONFIG_HOME/niri/dms` to be included into the new config
              "alttab" # Please note that niri will throw an error if any of these files are missing.
              "binds"
              "colors"
              "layout"
              "outputs"
            ];
          };

          # Core features
          enableSystemMonitoring = true; # System monitoring widgets (dgop)
          enableVPN = true; # VPN management widget
          enableDynamicTheming = true; # Wallpaper-based theming (matugen)
          enableAudioWavelength = true; # Audio visualizer (cava)
          enableCalendarEvents = false; # Calendar integration (khal)
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
            controlCenterWidgets =
              map
                (id: {
                  enabled = true;
                  inherit id;
                  width = 50;
                })
                [
                  "volumeSlider"
                  "brightnessSlider"
                  "wifi"
                  "bluetooth"
                  "audioOutput"
                  "audioInput"
                  "nightMode"
                  "darkMode"
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
            disabled = false;
            disableHistory = false;
            disablePersist = false;
          };

          # Auto-enabled when plugins have settings configured
          managePluginSettings = true;

          plugins = {
            # Simply enable plugins by their ID (from the registry)
            # dankBatteryAlerts.enable = true;
            dockerManager.enable = true;
            usbManager.enable = true;
            githubNotifier.enable = true;

            # Add plugin-specific settings
            mediaPlayer = {
              enable = true;

              # You can only define settings here if using the home-manager module
              # settings = {
              #   preferredSource = "spotify";
              # };
            };
          };
        };
      };
    };
    noctalia = {
      homeManager = {
        imports = [ inputs.noctalia.homeModules.default ];
        programs.noctalia-shell = {
          enable = true;
          settings = {
            # configure noctalia here
            appLauncher = {
              autoPasteClipboard = false;
              clipboardWatchImageCommand = "wl-paste --type image --watch cliphist store";
              clipboardWatchTextCommand = "wl-paste --type text --watch cliphist store";
              clipboardWrapText = true;
              customLaunchPrefix = "";
              customLaunchPrefixEnabled = false;
              density = "default";
              enableClipPreview = true;
              enableClipboardChips = true;
              enableClipboardHistory = false;
              enableClipboardSmartIcons = true;
              enableSessionSearch = true;
              enableSettingsSearch = true;
              enableWindowsSearch = true;
              iconMode = "tabler";
              ignoreMouseInput = false;
              overviewLayer = false;
              pinnedApps = [
              ];
              position = "center";
              screenshotAnnotationTool = "";
              showCategories = true;
              showIconBackground = false;
              sortByMostUsed = true;
              terminalCommand = "alacritty -e";
              viewMode = "list";
            };
            audio = {
              mprisBlacklist = [
              ];
              preferredPlayer = "";
              spectrumFrameRate = 30;
              spectrumMirrored = true;
              visualizerType = "linear";
              volumeFeedback = false;
              volumeFeedbackSoundFile = "";
              volumeOverdrive = false;
              volumeStep = 5;
            };
            brightness = {
              backlightDeviceMappings = [
              ];
              brightnessStep = 5;
              enableDdcSupport = false;
              enforceMinimum = true;
            };
            calendar = {
              cards = [
                {
                  enabled = true;
                  id = "calendar-header-card";
                }
                {
                  enabled = true;
                  id = "calendar-month-card";
                }
                {
                  enabled = true;
                  id = "weather-card";
                }
              ];
            };
            controlCenter = {
              cards = [
                {
                  enabled = true;
                  id = "profile-card";
                }
                {
                  enabled = true;
                  id = "shortcuts-card";
                }
                {
                  enabled = true;
                  id = "audio-card";
                }
                {
                  enabled = false;
                  id = "brightness-card";
                }
                {
                  enabled = true;
                  id = "weather-card";
                }
                {
                  enabled = true;
                  id = "media-sysmon-card";
                }
              ];
              diskPath = "/";
              position = "close_to_bar_button";
              shortcuts = {
                left = [
                  {
                    id = "Network";
                  }
                  {
                    id = "Bluetooth";
                  }
                  {
                    id = "WallpaperSelector";
                  }
                  {
                    id = "NoctaliaPerformance";
                  }
                ];
                right = [
                  {
                    id = "Notifications";
                  }
                  {
                    id = "PowerProfile";
                  }
                  {
                    id = "KeepAwake";
                  }
                  {
                    id = "NightLight";
                  }
                ];
              };
            };
            desktopWidgets = {
              enabled = true;
              gridSnap = true;
              gridSnapScale = true;
              monitorWidgets = [
                {
                  name = "DP-3";
                  widgets = [
                    {
                      clockColor = "primary";
                      clockStyle = "analog";
                      customFont = "";
                      format = "HH:mm\\nd MMMM yyyy";
                      id = "Clock";
                      roundedCorners = true;
                      scale = 2.2884074808869883;
                      showBackground = false;
                      useCustomFont = false;
                      x = 40;
                      y = 80;
                    }
                    {
                      id = "Weather";
                      roundedCorners = true;
                      scale = 1.2996389891696751;
                      showBackground = true;
                      x = 40;
                      y = 440;
                    }
                    {
                      diskPath = "/";
                      id = "SystemStat";
                      layout = "bottom";
                      roundedCorners = true;
                      scale = 2.5;
                      showBackground = true;
                      statType = "CPU";
                      x = 1560;
                      y = 80;
                    }
                    {
                      colorName = "primary";
                      height = 72;
                      hideWhenIdle = false;
                      id = "AudioVisualizer";
                      roundedCorners = true;
                      scale = 2.5;
                      showBackground = true;
                      visualizerType = "linear";
                      width = 320;
                      x = 1560;
                      y = 480;
                    }
                    {
                      defaultSettings = {
                        hideBackground = false;
                        minimumThreshold = 10;
                      };
                      id = "plugin:catwalk";
                      scale = 4.76;
                      showBackground = true;
                      x = 1800;
                      y = 760;
                    }
                  ];
                }
              ];
              overviewEnabled = true;
            };
            dock = {
              animationSpeed = 1;
              backgroundOpacity = 1;
              colorizeIcons = true;
              deadOpacity = 0.6;
              displayMode = "auto_hide";
              dockType = "attached";
              enabled = true;
              floatingRatio = 1;
              groupApps = true;
              groupClickAction = "cycle";
              groupContextMenuMode = "extended";
              groupIndicatorStyle = "dots";
              inactiveIndicators = true;
              indicatorColor = "primary";
              indicatorOpacity = 0.6;
              indicatorThickness = 3;
              launcherIcon = "";
              launcherIconColor = "none";
              launcherPosition = "end";
              launcherUseDistroLogo = false;
              monitors = [ ];
              onlySameOutput = true;
              pinnedApps = [ ];
              pinnedStatic = false;
              position = "bottom";
              showDockIndicator = true;
              showLauncherIcon = false;
              sitOnFrame = false;
              size = 1;
            };
            hooks = {
              colorGeneration = "";
              darkModeChange = "";
              enabled = false;
              performanceModeDisabled = "";
              performanceModeEnabled = "";
              screenLock = "";
              screenUnlock = "";
              session = "";
              startup = "";
              wallpaperChange = "";
            };
            idle = {
              customCommands = "[]";
              enabled = true;
              fadeDuration = 5;
              lockCommand = "";
              lockTimeout = 660;
              resumeLockCommand = "";
              resumeScreenOffCommand = "";
              resumeSuspendCommand = "";
              screenOffCommand = "";
              screenOffTimeout = 600;
              suspendCommand = "";
              suspendTimeout = 1800;
            };
            location = {
              analogClockInCalendar = true;
              autoLocate = true;
              firstDayOfWeek = -1;
              hideWeatherCityName = false;
              hideWeatherTimezone = false;
              name = "Giza";
              showCalendarEvents = true;
              showCalendarWeather = true;
              showWeekNumberInCalendar = false;
              use12hourFormat = true;
              useFahrenheit = false;
              weatherEnabled = true;
              weatherShowEffects = true;
              weatherTaliaMascotAlways = false;
            };
            network = {
              bluetoothAutoConnect = true;
              bluetoothDetailsViewMode = "grid";
              bluetoothHideUnnamedDevices = false;
              bluetoothRssiPollIntervalMs = 60000;
              bluetoothRssiPollingEnabled = false;
              disableDiscoverability = false;
              networkPanelView = "wifi";
              wifiDetailsViewMode = "grid";
            };
            nightLight = {
              autoSchedule = true;
              dayTemp = "6500";
              enabled = false;
              forced = false;
              manualSunrise = "06:30";
              manualSunset = "18:30";
              nightTemp = "4000";
            };
            noctaliaPerformance = {
              disableDesktopWidgets = true;
              disableWallpaper = true;
            };
            notifications = {
              backgroundOpacity = 1;
              clearDismissed = true;
              criticalUrgencyDuration = 15;
              density = "default";
              enableBatteryToast = true;
              enableKeyboardLayoutToast = true;
              enableMarkdown = false;
              enableMediaToast = false;
              enabled = true;
              location = "top_right";
              lowUrgencyDuration = 3;
              monitors = [
              ];
              normalUrgencyDuration = 8;
              overlayLayer = true;
              respectExpireTimeout = false;
              saveToHistory = {
                critical = true;
                low = true;
                normal = true;
              };
              sounds = {
                criticalSoundFile = "";
                enabled = false;
                excludedApps = "discord,firefox,chrome,chromium,edge";
                lowSoundFile = "";
                normalSoundFile = "";
                separateSounds = false;
                volume = 0.5;
              };
            };
            osd = {
              autoHideMs = 2000;
              backgroundOpacity = 1;
              enabled = true;
              enabledTypes = [
                0
                1
                2
              ];
              location = "top_right";
              monitors = [ ];
              overlayLayer = true;
            };
            plugins = {
              autoUpdate = false;
              notifyUpdates = true;
            };
            sessionMenu = {
              countdownDuration = 10000;
              enableCountdown = true;
              largeButtonsLayout = "single-row";
              largeButtonsStyle = true;
              position = "center";
              powerOptions = [
                {
                  action = "lock";
                  command = "";
                  countdownEnabled = true;
                  enabled = true;
                  keybind = "1";
                }
                {
                  action = "suspend";
                  command = "";
                  countdownEnabled = true;
                  enabled = true;
                  keybind = "2";
                }
                {
                  action = "hibernate";
                  command = "";
                  countdownEnabled = true;
                  enabled = true;
                  keybind = "3";
                }
                {
                  action = "reboot";
                  command = "";
                  countdownEnabled = true;
                  enabled = true;
                  keybind = "4";
                }
                {
                  action = "logout";
                  command = "";
                  countdownEnabled = true;
                  enabled = true;
                  keybind = "5";
                }
                {
                  action = "shutdown";
                  command = "";
                  countdownEnabled = true;
                  enabled = true;
                  keybind = "6";
                }
                {
                  action = "rebootToUefi";
                  command = "";
                  countdownEnabled = true;
                  enabled = true;
                  keybind = "7";
                }
                {
                  action = "userspaceReboot";
                  command = "";
                  countdownEnabled = true;
                  enabled = false;
                  keybind = "";
                }
              ];
              showHeader = true;
              showKeybinds = true;
            };
            settingsVersion = 59;
            systemMonitor = {
              batteryCriticalThreshold = 5;
              batteryWarningThreshold = 20;
              cpuCriticalThreshold = 90;
              cpuWarningThreshold = 80;
              criticalColor = "";
              diskAvailCriticalThreshold = 10;
              diskAvailWarningThreshold = 20;
              diskCriticalThreshold = 90;
              diskWarningThreshold = 80;
              enableDgpuMonitoring = false;
              externalMonitor = "resources || missioncenter || jdsystemmonitor || corestats || system-monitoring-center || gnome-system-monitor || plasma-systemmonitor || mate-system-monitor || ukui-system-monitor || deepin-system-monitor || pantheon-system-monitor";
              gpuCriticalThreshold = 90;
              gpuWarningThreshold = 80;
              memCriticalThreshold = 90;
              memWarningThreshold = 80;
              swapCriticalThreshold = 90;
              swapWarningThreshold = 80;
              tempCriticalThreshold = 90;
              tempWarningThreshold = 80;
              useCustomColors = false;
              warningColor = "";
            };
            templates = {
              activeTemplates = [
              ];
              enableUserTheming = false;
            };
            ui = {
              boxBorderEnabled = false;
              fontDefault = "Sans Serif";
              fontDefaultScale = 1;
              fontFixed = "monospace";
              fontFixedScale = 1;
              panelBackgroundOpacity = 0.93;
              panelsAttachedToBar = true;
              scrollbarAlwaysVisible = true;
              settingsPanelMode = "attached";
              settingsPanelSideBarCardStyle = false;
              tooltipsEnabled = true;
              translucentWidgets = false;
            };
            wallpaper = {
              automationEnabled = false;
              directory = "/home/mohamed/Pictures/Wallpapers";
              enableMultiMonitorDirectories = false;
              enabled = true;
              favorites = [
              ];
              fillColor = "#000000";
              fillMode = "crop";
              hideWallpaperFilenames = false;
              linkLightAndDarkWallpapers = true;
              monitorDirectories = [
              ];
              overviewBlur = 0.4;
              overviewEnabled = false;
              overviewTint = 0.6;
              panelPosition = "follow_bar";
              randomIntervalSec = 300;
              setWallpaperOnAllMonitors = true;
              showHiddenFiles = false;
              skipStartupTransition = false;
              solidColor = "#1a1a2e";
              sortOrder = "name";
              transitionDuration = 1500;
              transitionEdgeSmoothness = 0.05;
              transitionType = [
                "fade"
                "disc"
                "stripes"
                "wipe"
                "pixelate"
                "honeycomb"
              ];
              useOriginalImages = false;
              useSolidColor = false;
              useWallhaven = false;
              viewMode = "single";
              wallhavenApiKey = "";
              wallhavenCategories = "111";
              wallhavenOrder = "desc";
              wallhavenPurity = "100";
              wallhavenQuery = "";
              wallhavenRatios = "";
              wallhavenResolutionHeight = "";
              wallhavenResolutionMode = "atleast";
              wallhavenResolutionWidth = "";
              wallhavenSorting = "relevance";
              wallpaperChangeMode = "random";
            };
            bar = {
              autoHideDelay = 500;
              autoShowDelay = 150;
              backgroundOpacity = 0.93;
              barType = "floating";
              capsuleColorKey = "none";
              capsuleOpacity = 1;
              contentPadding = 2;
              displayMode = "always_visible";
              enableExclusionZoneInset = true;
              fontScale = 1;
              frameRadius = 12;
              frameThickness = 8;
              hideOnOverview = false;
              marginHorizontal = 4;
              marginVertical = 4;
              middleClickAction = "none";
              middleClickCommand = "";
              middleClickFollowMouse = false;
              monitors = [ ];
              mouseWheelAction = "content";
              mouseWheelWrap = true;
              outerCorners = true;
              reverseScroll = false;
              rightClickAction = "controlCenter";
              rightClickCommand = "";
              rightClickFollowMouse = true;
              screenOverrides = [ ];
              showOnWorkspaceSwitch = true;
              showOutline = false;
              useSeparateOpacity = false;
              widgetSpacing = 6;
              density = "default";
              position = "top";
              showCapsule = false;
              widgets = {
                left = [
                  {
                    colorizeDistroLogo = false;
                    colorizeSystemIcon = "none";
                    colorizeSystemText = "none";
                    customIconPath = "";
                    enableColorization = true;
                    icon = "noctalia";
                  }
                  {
                    characterCount = 2;
                    colorizeIcons = false;
                    emptyColor = "secondary";
                    enableScrollWheel = true;
                    focusedColor = "primary";
                    followFocusedScreen = false;
                    fontWeight = "bold";
                    groupedBorderOpacity = 1;
                    hideUnoccupied = false;
                    iconScale = 0.8;
                    labelMode = "index";
                    occupiedColor = "secondary";
                    pillSize = 0.6;
                    showApplications = false;
                    showApplicationsHover = false;
                    showBadge = true;
                    showLabelsOnlyWhenOccupied = true;
                    unfocusedIconsOpacity = 1;
                    id = "Workspace";
                  }
                ];
                center = [
                  {
                    clockColor = "none";
                    customFont = "";
                    formatHorizontal = "h:mm AP dddd MMM dd";
                    formatVertical = "HH mm";
                    tooltipFormat = "HH:mm ddd, MMM dd";
                    useCustomFont = false;
                    id = "Clock";
                  }
                  {
                    defaultSettings = {
                      hideBackground = false;
                      minimumThreshold = 10;
                    };
                    id = "plugin:catwalk";
                  }
                ];
                right = [
                  {
                    id = "Tray";
                    blacklist = [ ];
                    chevronColor = "none";
                    colorizeIcons = false;
                    drawerEnabled = true;
                    hidePassive = false;
                    pinned = [ ];
                  }
                  {
                    compactMode = true;
                    diskPath = "/";
                    iconColor = "none";
                    showCpuCores = false;
                    showCpuFreq = false;
                    showCpuTemp = true;
                    showCpuUsage = true;
                    showDiskAvailable = false;
                    showDiskUsage = false;
                    showDiskUsageAsPercent = false;
                    showGpuTemp = false;
                    showLoadAverage = false;
                    showMemoryAsPercent = true;
                    showMemoryUsage = true;
                    showNetworkStats = true;
                    showSwapUsage = true;
                    textColor = "none";
                    useMonospaceFont = true;
                    usePadding = false;
                    id = "SystemMonitor";
                  }
                  {
                    displayMode = "onhover";
                    iconColor = "none";
                    id = "Microphone";
                    middleClickCommand = "pwvucontrol || pavucontrol";
                    textColor = "none";
                  }
                  {
                    iconColor = "none";
                    id = "KeepAwake";
                    textColor = "none";
                  }
                  {
                    deviceNativePath = "__default__";
                    displayMode = "graphic-clean";
                    hideIfIdle = false;
                    hideIfNotDetected = true;
                    id = "Battery";
                    showNoctaliaPerformance = true;
                    showPowerProfiles = true;
                  }
                  {
                    displayMode = "onhover";
                    iconColor = "none";
                    id = "Network";
                    textColor = "none";
                  }
                  {
                    displayMode = "onhover";
                    iconColor = "none";
                    id = "Bluetooth";
                    textColor = "none";
                  }
                  {
                    displayMode = "onhover";
                    iconColor = "none";
                    id = "Volume";
                    middleClickCommand = "pwvucontrol || pavucontrol";
                    textColor = "none";
                  }
                ];
              };
            };
            colorSchemes.predefinedScheme = "Monochrome";
            colorSchemes = {
              darkMode = true;
              generationMethod = "tonal-spot";
              manualSunrise = "06:30";
              manualSunset = "18:30";
              monitorForColors = "";
              schedulingMode = "off";
              syncGsettings = true;
              useWallpaperColors = true;
            };
            general = {
              clockFormat = "hh\\nmm";
              clockStyle = "custom";
              screenRadiusRatio = 1;
              shadowDirection = "bottom_right";
              shadowOffsetX = 2;
              shadowOffsetY = 3;
              showChangelogOnStartup = true;
              showHibernateOnLockScreen = false;
              showScreenCorners = false;
              showSessionButtonsOnLockScreen = true;
              smoothScrollEnabled = true;
              telemetryEnabled = false;
              radiusRatio = 0.2;
              allowPanelsOnScreenWithoutBar = true;
              allowPasswordWithFprintd = false;
              animationDisabled = false;
              animationSpeed = 1;
              autoStartAuth = false;
              avatarImage = "/home/mohamed/.face";
              boxRadiusRatio = 1;
              compactLockScreen = false;
              dimmerOpacity = 0.2;
              enableBlurBehind = true;
              enableLockScreenCountdown = true;
              enableLockScreenMediaControls = false;
              enableShadows = true;
              forceBlackScreenCorners = false;
              iRadiusRatio = 1;
              keybinds = {
                keyDown = [ "Down" ];
                keyEnter = [
                  "Return"
                  "Enter"
                ];
                keyEscape = [ "Esc" ];
                keyLeft = [ "Left" ];
                keyRemove = [ "Del" ];
                keyRight = [ "Right" ];
                keyUp = [ "Up" ];
              };
              language = "";
              lockOnSuspend = true;
              lockScreenAnimations = false;
              lockScreenBlur = 0;
              lockScreenCountdownDuration = 10000;
              lockScreenMonitors = [ ];
              lockScreenTint = 0;
              passwordChars = false;
              reverseScroll = false;
              scaleRatio = 1;
            };
          };
          plugins = {
            sources = [
              {
                enabled = true;
                name = "Official Noctalia Plugins";
                url = "https://github.com/noctalia-dev/noctalia-plugins";
              }
            ];
            states = {
              catwalk = {
                enabled = true;
                sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
              };
            };
            version = 2;
          };
          # this may also be a string or a path to a JSON file.
          pluginSettings = {
            catwalk = {
              minimumThreshold = 25;
              hideBackground = true;
            };
            # this may also be a string or a path to a JSON file.
          };
        };
      };
    };
  };
}
