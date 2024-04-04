{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.blastdan.cli-apps.zsh;
in {
  options.blastdan.cli-apps.zsh = {
    enable = mkEnableOption "ZSH";
  };

  config = mkIf cfg.enable {
    home = {
      file = {
        ".p10k.zsh".source = ./.p10k.zsh;
      };
    };

    programs = {
      zsh = {
        enable = true;
        enableAutosuggestions = true;
        enableCompletion = true;
        syntaxHighlighting.enable = true;

        initExtra = ''
          # Fix an issue with tmux.
          export KEYTIMEOUT=1

          ${pkgs.toilet}/bin/toilet -f future "Blastdan" --gay
        '';

        shellAliases = {
          say = "${pkgs.toilet}/bin/toilet -f pagga";
        };

        zplug = {
            enable = true;
            plugins = [
            { name = "zsh-users/zsh-autosuggestions"; }
            { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; } # Installations with additional options. For the list of options, please refer to Zplug README.
            { name = "Aloxaf/fzf-tab"; }
          ];
        };
      };
    };
  };
}