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
      asciiquarium = enabled;
      zellij = enabled;
      helix = enabled;
      bat = enabled;
    };
    style ={
      catppuccin = {
        enable = true;
        flavour = "macchiato";
      };
    };
    system = {
      wsl = enabled;
    };
    tools = {
      git = enabled;
      direnv = enabled;
      go-task = enabled;
      bottom = enabled;
    };
    cloud = {
      gcloud = enabled;
      terraformer = enabled;
      tfenv = enabled;
      terragrunt = enabled;
      k8s = enabled;
      kind = enabled;
    };
    languages = {
      go = enabled;
      pyenv = enabled;
      kcl = enabled;
    };
  };

  home.stateVersion = "23.11";
}
