{ config, pkgs, ... }:
{
  xdg = {
    enable = true;
    dataHome = "${config.home.homeDirectory}/.local/share";
    mime.enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "x-scheme-handler/http" = "google-chrome.desktop";
        "x-scheme-handler/https" = "google-chrome.desktop";
        "x-scheme-handler/chrome" = "google-chrome.desktop";
        "text/html" = "google-chrome.desktop";
        "application/x-extension-htm" = "google-chrome.desktop";
        "application/x-extension-html" = "google-chrome.desktop";
        "application/x-extension-shtml" = "google-chrome.desktop";
        "application/xhtml+xml" = "google-chrome.desktop";
        "application/x-extension-xhtml" = "google-chrome.desktop";
        "application/x-extension-xht" = "google-chrome.desktop";
      };
      associations.added = {
        "x-scheme-handler/http" = [ "google-chrome.desktop" ];
        "x-scheme-handler/https" = [ "google-chrome.desktop" ];
        "x-scheme-handler/chrome" = [ "google-chrome.desktop" ];
      };
    };
    portal = {
      enable = true;
      extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
      config.common.default = "gtk";
    };
  };
}
