{ options, config, lib, pkgs, ... }:

with lib;
with lib.blastdan;
let cfg = config.blastdan.desktop.addons.foot;
in
{
  options.blastdan.desktop.addons.foot = with types; {
    enable = mkBoolOpt false "Whether to enable the gnome file manager.";
  };

  config = mkIf cfg.enable {
    blastdan.desktop.addons.term = {
      enable = true;
      pkg = pkgs.foot;
    };

    blastdan.home.configFile."foot/foot.ini".source = ./foot.ini;
  };
}
