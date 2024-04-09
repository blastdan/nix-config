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
      gh-dash = enabled;
      zsh = enabled;
      fzf = enabled;
      zoxide = enabled;
    };

    tools = {
      git = enabled;
      direnv = enabled;
    };
    cloud = {
      gcloud = enabled;
      terraformer = enabled;
      tfenv = enabled;
    };
  };

  home.stateVersion = "23.11";
}