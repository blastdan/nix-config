{ lib, config, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.blastdan) enabled;

  cfg = config.blastdan.cli-apps.home-manager;
  name = config.blastdan.user.name;
in
{
  options.blastdan.cli-apps.home-manager = {
    enable = mkEnableOption "home-manager";
  };

  config = mkIf cfg.enable {
    programs.home-manager = enabled;

    programs.zsh.shellAliases = {
      switch = "home-manager switch --flake .#${name}";
    };
  };
}