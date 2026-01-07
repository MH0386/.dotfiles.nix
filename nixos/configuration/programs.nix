{ pkgs, ... }:
{
  programs = {
    niri.enable = true;
    dms-shell.enable = true;
    zsh.enable = true;
    # evolution.enable = true;
    nix-ld.enable = true;
    virt-manager.enable = true;
    obs-studio = {
      enable = true;
      enableVirtualCamera = true;
      plugins = with pkgs; [
        obs-studio-plugins.obs-pipewire-audio-capture
        obs-studio-plugins.obs-backgroundremoval
      ];
    };
    localsend.enable = true;
    appimage = {
      enable = true;
      binfmt = true;
    };
    gamemode.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
    # coolercontrol.enable = true;
    nh = {
      enable = true;
      flake = "/home/mohamed/.dotfiles";
      clean = {
        enable = true;
        extraArgs = "--keep 5";
      };
    };
    nautilus-open-any-terminal = {
      enable = true;
      terminal = "ptyxis";
    };
    # Some programs need SUID wrappers, can be configured further or are started in user sessions.
    # programs.mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
}
