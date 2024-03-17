{ options, config, lib, pkgs, ... }:

with lib;
with lib.blastdan;
let
  cfg = config.blastdan.desktop.addons.firefox-nordic-theme;
  profileDir = ".mozilla/firefox/${config.blastdan.user.name}";
in
{
  options.blastdan.desktop.addons.firefox-nordic-theme = with types; {
    enable = mkBoolOpt false "Whether to enable the Nordic theme for firefox.";
  };

  config = mkIf cfg.enable {
    blastdan.apps.firefox = {
      extraConfig = builtins.readFile
        "${pkgs.blastdan.firefox-nordic-theme}/configuration/user.js";
      userChrome = ''
        @import "${pkgs.blastdan.firefox-nordic-theme}/userChrome.css";
      '';
    };
  };
}
