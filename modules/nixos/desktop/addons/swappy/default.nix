{ options, config, lib, pkgs, ... }:

with lib;
with lib.blastdan;
let cfg = config.blastdan.desktop.addons.swappy;
in
{
  options.blastdan.desktop.addons.swappy = with types; {
    enable =
      mkBoolOpt false "Whether to enable Swappy in the desktop environment.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ swappy ];

    blastdan.home.configFile."swappy/config".source = ./config;
    blastdan.home.file."Pictures/screenshots/.keep".text = "";
  };
}
