_: {
  programs = {
    appimage = {
      enable = true;
      binfmt = true;
    };
    # evolution.enable = true;
    gamemode.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    localsend.enable = true;
    nautilus-open-any-terminal = {
      enable = true;
      terminal = "ghostty";
    };
    nh = {
      enable = true;
      flake = "/home/mohamed/.dotfiles";
      clean = {
        enable = true;
        extraArgs = "--keep 5";
      };
    };
    niri.enable = true;
    nix-ld.enable = true;
    seahorse.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
    virt-manager.enable = true;
    xonsh = {
      enable = true;
      config = "execx($(atuin init xonsh))";
    };
    zsh.enable = true;
    # coolercontrol.enable = true;
    # Some programs need SUID wrappers, can be configured further or are started in user sessions.
    # programs.mtr.enable = true;
  };
}
