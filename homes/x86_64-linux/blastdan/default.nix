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
      gh = enabled;
      xzoom = enabled;
    };
    tools = {
      git = enabled;
      direnv = enabled;
      devbox = enabled;
    };
    cloud = {
      gcloud =  enabled;
    };
  };
}