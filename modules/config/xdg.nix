{
  delib,
  homeconfig,
  pkgs,
  ...
}:
delib.module {
  name = "xdg";

  options.xdg = with delib; {
    enable = boolOption true;
    mime = {
      recommended = attrsOfOption str {
        "x-scheme-handler/http" = "zen.desktop";
        "x-scheme-handler/https" = "zen.desktop";
        "x-scheme-handler/chrome" = "zen.desktop";
        "text/html" = "zen.desktop";
        "application/x-extension-htm" = "zen.desktop";
        "application/x-extension-html" = "zen.desktop";
        "application/x-extension-shtml" = "zen.desktop";
        "application/xhtml+xml" = "zen.desktop";
        "application/x-extension-xhtml" = "zen.desktop";
        "application/x-extension-xht" = "zen.desktop";
      };
      associations = attrsOfOption (listOf str) {
        "x-scheme-handler/http" = [ "zen.desktop" ];
        "x-scheme-handler/https" = [ "zen.desktop" ];
        "x-scheme-handler/chrome" = [ "zen.desktop" ];
      };
      removed = attrsOfOption (listOf str) { };
    };
  };

  # myconfig.ifEnabled.persist.user.directories = ["media" "files"];

  home.ifEnabled =
    { cfg, ... }:
    {
      xdg = {
        inherit (cfg) enable;

        userDirs =
          let
            download = "${homeconfig.home.homeDirectory}/download";
            media = category: "${homeconfig.home.homeDirectory}/media/${category}";
            files = category: "${homeconfig.home.homeDirectory}/files/${category}";
          in
          {
            enable = true;
            createDirectories = true;

            inherit download;
            pictures = media "pictures";
            documents = files "documents";
            desktop = files "desktop";
            videos = media "videos";
            music = media "music";
            publicShare = files "publicshare";
            templates = files "templates";
          };
        mime.enable = true;
        mimeApps = {
          enable = true;

          defaultApplications = cfg.mime.recommended;
          associations.added = cfg.mime.associations;
          associations.removed = cfg.mime.removed;
        };

        portal = {
          enable = true;
          extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
          config.common.default = "gtk";
        };
      };
    };

  nixos.ifEnabled.environment.variables.XDG_CACHE_DIR = "${homeconfig.home.homeDirectory}/.cache";
}
