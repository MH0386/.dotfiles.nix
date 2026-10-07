{
  den.default = {
    homeManager = {
      xdg = {
        mime.enable = true;
        mimeApps =
          let
            browser = "google-chrome.desktop";
          in
          {
            enable = true;
            defaultApplications = {
              "x-scheme-handler/http" = browser;
              "x-scheme-handler/https" = browser;
              "x-scheme-handler/chrome" = browser;
              "text/html" = browser;
              "application/x-extension-htm" = browser;
              "application/x-extension-html" = browser;
              "application/x-extension-shtml" = browser;
              "application/xhtml+xml" = browser;
              "application/x-extension-xhtml" = browser;
              "application/x-extension-xht" = browser;
            };
            associations.added = {
              "x-scheme-handler/http" = [ browser ];
              "x-scheme-handler/https" = [ browser ];
              "x-scheme-handler/chrome" = [ browser ];
            };
          };
      };
    };
  };
}
