{ config
, lib
, ...
}:
with lib.blastdan;
{
  blastdan = {
    user = {
      enable = true;
      inherit (config.snowfallorg.user) name;
    };

    cli-apps = {
      home-manager = enabled;
      k9s = enabled;
      lazygit = enabled;
      gh = enabled;
      zsh = enabled;
      fzf = enabled;
      zoxide = enabled;
    };

    tools = {
      git = enabled;
      direnv = enabled;
      devbox = enabled;
    };
    cloud = {
      gcloud = enabled;
    };
  };

  home.stateVersion = "23.11";
}
