{ inputs, ... }:
{
  den.default = {
    homeManager = {
      imports = [ inputs.nix-flatpak.homeManagerModules.nix-flatpak ];
      services.flatpak = {
        enable = true;
        uninstallUnmanaged = true;
        update.onActivation = true;
      };
    };
    nixos = {
      services.flatpak.enable = true;
      xdg.portal.enable = true;
    };
  };
}
