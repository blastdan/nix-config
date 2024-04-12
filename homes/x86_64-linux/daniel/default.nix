{ config
, lib
, ...
}:
with lib.blastdan;
{
  blastdan = {
    user = {
      enable = true;
    };

    cli-apps = {
      home-manager = enabled;
      k9s = enabled;
      lazygit = enabled;
      gh = enabled;
      zsh = {
        enable = true;
        greeting = "Ubuntu";
      };
      fzf = enabled;
      zoxide = enabled;
      nix-prefetch-github = enabled;
    };

    tools = {
      git = enabled;
      direnv = enabled;
      go-task = enabled;
    };
    cloud = {
      gcloud = enabled;
      terraformer = enabled;
      tfenv = enabled;
      terragrunt = enabled;
      k8s = enabled;
    };
    languages = {
      go = enabled;
    };
  };

  home.stateVersion = "23.11";
}
