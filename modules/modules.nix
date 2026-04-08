{ inputs, ... }:
{
  den.default = {
    homeManager = {
      imports = [
        inputs.nix-flatpak.homeManagerModules.nix-flatpak
        inputs.niri.homeModules.niri
        inputs.dms.homeModules.dank-material-shell
        inputs.dms.homeModules.niri
        inputs.dms-plugin-registry.modules.default
      ];
    };
  };
}
