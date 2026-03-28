{
  pkgs,
  pkgsStable,
  ...
}:
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
    file = { };
    shellAliases = {
      ll = "ls -l";
      la = "ls -la";
      l = "ls";
      c = "clear";
      h = "history";
    };
    packages =
      (with pkgs; [
        act
        affine
        antigravity
        bazaar
        beeper
        bitwarden-cli
        bitwarden-desktop
        bottles
        cagent
        clapper
        czkawka
        dconf-editor
        devenv
        dialect
        dioxus-cli
        doppler
        ffmpeg
        fluffychat
        gdm-settings
        git-filter-repo
        git-xet
        github-copilot-cli
        glib
        gnome-boxes
        gnome-contacts
        gtk3
        httpie
        httpie-desktop
        jan
        kompose
        kubectl
        kubernetes
        lmstudio
        mediawriter
        nil
        nixd
        nixfmt
        nixpkgs-reviewFull
        opencode-desktop
        podman-desktop
        pods
        postman
        pre-commit
        prek
        proton-authenticator
        proton-pass
        pyrefly
        python3Packages.python-lsp-server
        remmina
        rustscan
        rustup
        shotwell
        spacedrive
        szyszka
        termius
        trivy
        undollar
        vlc
        warehouse
        warp-terminal
        winboat
        yq-go
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
