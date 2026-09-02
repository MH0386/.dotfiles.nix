{
  den.default = {
    nixos = {
      i18n =
        let
          locale = "en_US.UTF-8";
        in
        {
          extraLocaleSettings = {
            LANGUAGE = locale;
            LC_ALL = locale;
            LC_CTYPE = locale;
            LC_COLLATE = locale;
            LC_MESSAGES = locale;
            LC_ADDRESS = locale;
            LC_IDENTIFICATION = locale;
            LC_MEASUREMENT = locale;
            LC_MONETARY = locale;
            LC_NAME = locale;
            LC_NUMERIC = locale;
            LC_PAPER = locale;
            LC_TELEPHONE = locale;
            LC_TIME = locale;
          };
          # Select internationalisation properties.
          defaultLocale = locale;
        };
      # Set your time zone.
      time.timeZone = "Africa/Cairo";
      environment.variables.TZ = "Africa/Cairo";
    };
  };
}
