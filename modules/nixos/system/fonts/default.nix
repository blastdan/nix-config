{
  options,
  config,
  pkgs,
  lib,
  ...
}:
with lib;
with lib.blastdan; let
  cfg = config.blastdan.system.fonts;
in {
  options.blastdan.system.fonts = with types; {
    enable = mkBoolOpt false "Whether or not to manage fonts.";
    fonts = mkOpt (listOf package) [] "Custom font packages to install.";
  };

  config = mkIf cfg.enable {
    environment.variables = {
      # Enable icons in tooling since we have nerdfonts.
      LOG_ICONS = "true";
    };

    environment.systemPackages = with pkgs; [font-manager];

    fonts.packages = with pkgs;
      [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        noto-fonts-emoji
        (nerdfonts.override {fonts = ["Hack" "Meslo"];})
      ]
      ++ cfg.fonts;
  };
}
