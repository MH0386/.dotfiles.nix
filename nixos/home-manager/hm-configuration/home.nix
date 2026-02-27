{
  pkgs,
  pkgsStable,
  nix-jetbrains-plugins,
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
    packages = [
      (pkgs.jetbrains.plugins.addPlugins pkgs.jetbrains.pycharm [
        nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.pycharm."2025.3"."org.jetbrains.junie"
        nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.pycharm."2025.3"."com.intellij.ml.llm"
        nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.pycharm."2025.3"."mobi.hsz.idea.gitignore"
        nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.pycharm."2025.3"."nix-idea"
        nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.pycharm."2025.3"."com.github.xepozz.gitattributes"
        nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.pycharm."2025.3"."com.aquasecurity.plugins.intellij-Trivy"
        nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.pycharm."2025.3"."net.seesharpsoft.intellij.plugins.csv"
        nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.pycharm."2025.3"."com.intellij.ideolog"
        nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.pycharm."2025.3"."org.sonarlint.idea"
        nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.pycharm."2025.3"."sourcery.pycharm-plugin"
        nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.pycharm."2025.3"."String Manipulation"
        nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.pycharm."2025.3"."tanvd.grazi"
        nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.pycharm."2025.3"."izhangzhihao.rainbow.brackets"
        nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.pycharm."2025.3"."indent-rainbow.indent-rainbow"
        nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.pycharm."2025.3"."com.ultrahob.zerolength.plugin"
        nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.pycharm."2025.3"."com.wakatime.intellij.plugin"
        nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.pycharm."2025.3"."ru.adelf.idea.dotenv"
        nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.pycharm."2025.3"."com.github.copilot"
        nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.pycharm."2025.3"."com.kozhun.commit-message-template"
      ])
      (pkgs.jetbrains.plugins.addPlugins pkgs.jetbrains.rust-rover [
        nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.rust-rover."2025.3"."org.jetbrains.junie"
        nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.rust-rover."2025.3"."com.intellij.ml.llm"
        nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.rust-rover."2025.3"."mobi.hsz.idea.gitignore"
        nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.rust-rover."2025.3"."nix-idea"
        nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.rust-rover."2025.3"."com.github.xepozz.gitattributes"
        nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.rust-rover."2025.3"."com.aquasecurity.plugins.intellij-Trivy"
        nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.rust-rover."2025.3"."net.seesharpsoft.intellij.plugins.csv"
        nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.rust-rover."2025.3"."com.intellij.ideolog"
        nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.rust-rover."2025.3"."org.sonarlint.idea"
        nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.rust-rover."2025.3"."String Manipulation"
        nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.rust-rover."2025.3"."tanvd.grazi"
        nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.rust-rover."2025.3"."izhangzhihao.rainbow.brackets"
        nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.rust-rover."2025.3"."indent-rainbow.indent-rainbow"
        nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.rust-rover."2025.3"."com.ultrahob.zerolength.plugin"
        nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.rust-rover."2025.3"."com.wakatime.intellij.plugin"
        nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.rust-rover."2025.3"."ru.adelf.idea.dotenv"
        nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.rust-rover."2025.3"."com.github.copilot"
        nix-jetbrains-plugins.plugins.${pkgs.stdenv.hostPlatform.system}.rust-rover."2025.3"."com.kozhun.commit-message-template"
      ])
    ]
    ++ (with pkgs; [
      postman
      # vscodium
      nixpkgs-reviewFull
      proton-pass
      proton-authenticator
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
