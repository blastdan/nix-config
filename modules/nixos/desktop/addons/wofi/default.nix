{ options, config, lib, pkgs, ... }:

with lib;
with lib.blastdan;
let cfg = config.blastdan.desktop.addons.wofi;
in
{
  options.blastdan.desktop.addons.wofi = with types; {
    enable =
      mkBoolOpt false "Whether to enable the Wofi in the desktop environment.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ wofi wofi-emoji ];

    # config -> .config/wofi/config
    # css -> .config/wofi/style.css
    # colors -> $XDG_CACHE_HOME/wal/colors
    # blastdan.home.configFile."foot/foot.ini".source = ./foot.ini;
    blastdan.home.configFile."wofi/config".source = ./config;
    blastdan.home.configFile."wofi/style.css".source = ./style.css;
  };
}
