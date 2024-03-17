{ options, config, lib, pkgs, ... }:

with lib;
with lib.blastdan;
let
  cfg = config.blastdan.apps.firefox;
  defaultSettings = {
    "browser.aboutwelcome.enabled" = false;
    "browser.meta_refresh_when_inactive.disabled" = true;
    "browser.startup.homepage" = "https://hamho.me";
    "browser.bookmarks.showMobileBookmarks" = true;
    "browser.urlbar.suggest.quicksuggest.sponsored" = false;
    "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
    "browser.aboutConfig.showWarning" = false;
    "browser.ssb.enabled" = true;
  };
in
{
  options.blastdan.apps.firefox = with types; {
    enable = mkBoolOpt false "Whether or not to enable Firefox.";
    extraConfig =
      mkOpt str "" "Extra configuration for the user profile JS file.";
    userChrome =
      mkOpt str "" "Extra configuration for the user chrome CSS file.";
    settings = mkOpt attrs defaultSettings "Settings to apply to the profile.";
  };

  config = mkIf cfg.enable {
    blastdan.desktop.addons.firefox-nordic-theme = enabled;

    services.gnome.gnome-browser-connector.enable = config.blastdan.desktop.gnome.enable;

    blastdan.home = {
      file = {
        ".mozilla/native-messaging-hosts/com.dannyvankooten.browserpass.json".source = "${pkgs.browserpass}/lib/mozilla/native-messaging-hosts/com.dannyvankooten.browserpass.json";

        ".mozilla/native-messaging-hosts/org.gnome.chrome_gnome_shell.json".source = mkIf config.blastdan.desktop.gnome.enable "${pkgs.chrome-gnome-shell}/lib/mozilla/native-messaging-hosts/org.gnome.chrome_gnome_shell.json";
      };

      extraOptions = {
        programs.firefox = {
          enable = true;
          package = pkgs.firefox.override (
            {
              cfg = {
                enableBrowserpass = true;
                enableGnomeExtensions = config.blastdan.desktop.gnome.enable;
              };

              extraNativeMessagingHosts =
                optional
                  config.blastdan.desktop.gnome.enable
                  pkgs.gnomeExtensions.gsconnect;
            }
          );

          profiles.${config.blastdan.user.name} = {
            inherit (cfg) extraConfig userChrome settings;
            id = 0;
            name = config.blastdan.user.name;
          };
        };
      };
    };
  };
}
