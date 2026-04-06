{
  den.default = {
    homeManager = {
      services.flatpak = {
        enable = true;
        uninstallUnmanaged = true;
        update.onActivation = true;
      };
    };
    nixos = {
      services.flatpak.enable = true;
    };
  };
}
