{ options, config, lib, pkgs, ... }:

with lib;
with lib.blastdan;
let
  cfg = config.blastdan.apps.yt-music;
in
{
  options.blastdan.apps.yt-music = with types; {
    enable = mkBoolOpt false "Whether or not to enable YouTube Music.";
  };

  config =
    mkIf cfg.enable { environment.systemPackages = with pkgs.blastdan; [ yt-music ]; };
}