{ denix, ... }:
denix.module {
  name = "locale";

  options.locale = with denix; {
    i18n.defaultLocale = strOption "en_US.UTF-8";
    timeZone = strOption "Africa/Cairo";
  };

  nixos.always =
    { cfg, ... }:
    {
      i18n = {
        extraLocaleSettings = {
          LANGUAGE = cfg.i18n.defaultLocale;
          LC_ALL = cfg.i18n.defaultLocale;
          LC_CTYPE = cfg.i18n.defaultLocale;
          LC_COLLATE = cfg.i18n.defaultLocale;
          LC_MESSAGES = cfg.i18n.defaultLocale;
          LC_ADDRESS = cfg.i18n.defaultLocale;
          LC_IDENTIFICATION = cfg.i18n.defaultLocale;
          LC_MEASUREMENT = cfg.i18n.defaultLocale;
          LC_MONETARY = cfg.i18n.defaultLocale;
          LC_NAME = cfg.i18n.defaultLocale;
          LC_NUMERIC = cfg.i18n.defaultLocale;
          LC_PAPER = cfg.i18n.defaultLocale;
          LC_TELEPHONE = cfg.i18n.defaultLocale;
          LC_TIME = cfg.i18n.defaultLocale;
        };
        # Select internationalisation properties.
        inherit (cfg.i18n) defaultLocale;
      };
      # Set your time zone.
      time.timeZone = cfg.timeZone;
      environment.variables.TZ = cfg.timeZone;
    };
}
