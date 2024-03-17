{ options, config, pkgs, lib, ... }:

with lib;
with lib.blastdan;
let
  cfg = config.blastdan.desktop.addons.wallpapers;
  inherit (pkgs.blastdan) wallpapers;
in
{
  options.blastdan.desktop.addons.wallpapers = with types; {
    enable = mkBoolOpt false
      "Whether or not to add wallpapers to ~/Pictures/wallpapers.";
  };

  config = {
    blastdan.home.file = lib.foldl
      (acc: name:
        let wallpaper = wallpapers.${name};
        in
        acc // {
          "Pictures/wallpapers/${wallpaper.fileName}".source = wallpaper;
        })
      { }
      (wallpapers.names);
  };
}
