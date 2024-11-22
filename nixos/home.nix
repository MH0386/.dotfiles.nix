{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;
    git = {
      enable = true;
      userName = "Mohamed Hisham Abdelzaher";
      userEmail = "mohamed.hisham.abdelzaher@gmail.com";
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
            "flutter"
            "node"
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
  };

  services = {
    kdeconnect = {
      enable = true;
      indicator = true;
    };
  };

  home = {
    packages = with pkgs; [
      ffmpeg
      code-cursor
      clapper
      nodejs_22
      pixi
      vlc
      celeste
      distrobox
      jre
      autoflake
    ];
    sessionPath = [ ];
    sessionVariables = {
      ANDROID_HOME = "/home/mohamed/Android/Sdk";
      GSK_RENDERER = "ngl";
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
