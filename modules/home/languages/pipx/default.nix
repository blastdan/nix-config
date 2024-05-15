{ lib, config, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.blastdan) enabled;

  cfg = config.blastdan.languages.pipx;
in
{
  options.blastdan.languages.pipx = {
    enable = mkEnableOption "pipx";
  };

  config = mkIf cfg.enable {
    programs.zsh = {
        initExtra = ''
        # pipx Path
        export PIPX_ROOT="$HOME/.local"
        [[ -d $PIPX_ROOT/bin ]] && export PATH="$PIPX_ROOT/bin:$PATH"

        eval "$(register-python-argcomplete pipx)"
        '';
    };
  };
}
