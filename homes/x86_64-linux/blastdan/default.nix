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
    };
    tools = {
      git = enabled;
    };
  };
}