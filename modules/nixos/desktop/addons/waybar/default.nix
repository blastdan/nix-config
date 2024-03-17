{ options, config, lib, pkgs, ... }:

with lib;
with lib.blastdan;
let cfg = config.blastdan.desktop.addons.waybar;
in
{
  options.blastdan.desktop.addons.waybar = with types; {
    enable =
      mkBoolOpt false "Whether to enable Waybar in the desktop environment.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ waybar ];

    blastdan.home.configFile."waybar/config".source = ./config;
    blastdan.home.configFile."waybar/style.css".source = ./style.css;
  };
}
