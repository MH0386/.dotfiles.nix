{ delib, ... }:
delib.module {
  name = "flatpak";

  options.flatpak = with delib; {
    enable = boolOption host.flatpakFeatured;
    uninstallUnmanaged = boolOption true;
    update.onActivation = boolOption true;
    packages = listOptionOf str [
      "io.github.zaedus.spider"
      "io.gitlab.theevilskeleton.Upscaler"
    ];
  };

  home.ifEnabled.services.flatpak =
    { cfg, ... }:
    {
      inherit (cfg) enable;
      inherit (cfg) uninstallUnmanaged;
      update.onActivation = cfg.update.onActivation;
      inherit (cfg) packages;
    };
}
