{ delib, inputs, ... }:
delib.module {
  name = "flatpak";

  options.flatpak = with delib; {
    enable = boolOption true;
    uninstallUnmanaged = boolOption true;
    update.onActivation = boolOption true;
    packages = listOfOption str [ ];
  };

  home.always.imports = [ inputs.nix-flatpak.homeManagerModules.nix-flatpak ];
  home.ifEnabled =
    { cfg, ... }:
    {
      services.flatpak = {
        inherit (cfg) enable;
        inherit (cfg) uninstallUnmanaged;
        inherit (cfg) update;
      };
    };
}
