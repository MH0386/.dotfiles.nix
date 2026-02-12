{ pkgs, pkgsStable, ... }:
{
  # Wayland, X, etc. support for session vars
  # systemd.user.sessionVariables = config.home-manager.users.mohamed.home.sessionVariables;

  home = {
    pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      package = pkgs.whitesur-cursors;
      name = "WhiteSur-cursors";
      size = 24;
    };
    file = {
      ".config/niri/config.kdl".source = ./../dotfiles/tiling-window-manager/niri/config.kdl;
    };
    shellAliases = {
      ll = "ls -l";
      la = "ls -la";
      l = "ls";
      c = "clear";
      h = "history";
    };
    packages =
      (with pkgs; [
        jan
        pyrefly
        python3Packages.python-lsp-server
        opencode-desktop
        bazaar
        cagent
        github-copilot-cli
        lmstudio
        git-filter-repo
        git-xet
        fluffychat
        undollar
        affine
        winboat
        gdm-settings
        czkawka
        szyszka
        bottles
        pods
        warehouse
        antigravity
        dioxus-cli
        # newelle
        trivy
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
        # gimp-with-plugins
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
        nixfmt
        nixd
        nil
        devenv
      ])
      ++ (with pkgsStable; [
        upscaler
        upscayl
        livecaptions
      ]);
    sessionPath = [ ];
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
