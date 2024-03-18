{
  lib,
  pkgs,
  config,
  osConfig ? {},
  format ? "unknown",
  ...
}:
with lib.blastdan; {
  blastdan = {
    terminal = {
      kitty = enabled;
    };
    cli-apps = {
      home-manager = enabled;
      manix = enabled;
      k9s = enabled;
      lazygit = enabled;
    };
    tools = {
      git = enabled;
      direnv = enabled;
    };
  };
}