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
      k9s = enabled;
      lazygit = enabled;
      gh = enabled;
      zsh = enabled;
      fzf = enabled;
      zoxide = enabled;
      nix-prefetch-github = enabled;
    };
    tools = {
      git = enabled;
      direnv = enabled;
      devbox = enabled;
    };
    cloud = {
      gcloud = enabled;
      terraformer = enabled;
      tfenv = enabled;
    };
  };
}