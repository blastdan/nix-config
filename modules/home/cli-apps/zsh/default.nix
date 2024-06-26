{
  lib,
  config,
  pkgs,
  options,
  ...
}:
with lib;
with lib.blastdan;
let
  cfg = config.blastdan.cli-apps.zsh;
in {
  options.blastdan.cli-apps.zsh = {
    enable = mkEnableOption "ZSH";
    greeting = mkOpt types.str "Blastdan" "The greeting to show on new shells";
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
        enableCompletion = true;
        syntaxHighlighting.enable = true;
        syntaxHighlighting.catppuccin.enable = config.blastdan.style.catppuccin.enable;

        autosuggestion = {
          enable = true;
        };

        initExtraFirst = ''
          autoload -U bashcompinit
          bashcompinit
        '';

        initExtra = ''
          # Fix an issue with tmux.
          export KEYTIMEOUT=1

          ${pkgs.toilet}/bin/toilet -f future ${cfg.greeting} --gay

          # Navigate words with ctrl+arrow keys
          bindkey '^[Oc' forward-word                                     #
          bindkey '^[Od' backward-word                                    #
          bindkey '^[[1;5D' backward-word                                 #
          bindkey '^[[1;5C' forward-word                                  #
          bindkey '^H' backward-kill-word                                 # delete previous word with ctrl+backspace
          bindkey '^[[Z' undo                                             # Shift+tab undo last action
        '';

        shellAliases = {
          say = "${pkgs.toilet}/bin/toilet -f pagga";
          ls = "ls --color -l -h";
          grep="grep -n --color";
        };

        zplug = {
            enable = true;
            plugins = [
            { name = "zsh-users/zsh-autosuggestions"; }
            { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; } # Installations with additional options. For the list of options, please refer to Zplug README.
            { name = "Aloxaf/fzf-tab"; }
            { name = "chisui/zsh-nix-shell"; }
          ];
        };
      };
    };
  };
}