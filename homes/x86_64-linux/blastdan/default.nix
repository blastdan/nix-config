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
      zsh = {
        enable = true;
        greeting = "BoomBox";
      };
      fzf = enabled;
      zoxide = enabled;
      nix-prefetch-github = enabled;
      asciiquarium = enabled;
      zellij = enabled;
      helix = enabled;
    };
    tools = {
      git = enabled;
      direnv = enabled;
      go-task = enabled;
      bottom = enabled;
    };
    cloud = {
      gcloud = enabled;
      k8s = enabled;
      terraformer = enabled;
      tfenv = enabled;
    };
  };
}