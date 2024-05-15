{ lib, config, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.blastdan) enabled;

  cfg = config.blastdan.languages.pyenv;
in
{
  options.blastdan.languages.pyenv = {
    enable = mkEnableOption "pyenv";
  };

  config = mkIf cfg.enable {
    programs.zsh = {
        initExtra = ''
        # PyEnv Path
        export PYENV_ROOT="$HOME/.pyenv"
        [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
        eval "$(pyenv init -)"
        eval "$(pyenv virtualenv-init -)"
        '';
    };
  };
}
