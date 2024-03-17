{
  options,
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
with lib;
with lib.blastdan; let
  cfg = config.blastdan.home;
in {
  options.blastdan.home = with types; {
    file =
      mkOpt attrs {}
      (mdDoc "A set of files to be managed by home-manager's `home.file`.");
    configFile =
      mkOpt attrs {}
      (mdDoc "A set of files to be managed by home-manager's `xdg.configFile`.");
    extraOptions = mkOpt attrs {} "Options to pass directly to home-manager.";
  };

  config = {
    blastdan.home.extraOptions = {
      home.stateVersion = config.system.stateVersion;
      home.file = mkAliasDefinitions options.blastdan.home.file;
      xdg.enable = true;
      xdg.configFile = mkAliasDefinitions options.blastdan.home.configFile;
    };

    snowfallorg.user.${config.blastdan.user.name}.home.config = config.blastdan.home.extraOptions;

    home-manager = {
      useUserPackages = true;
      useGlobalPkgs = true;
    };
  };
}
