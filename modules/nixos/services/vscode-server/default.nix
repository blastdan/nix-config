{ options, config, lib, pkgs, ... }:

with lib;
with lib.blastdan;
let cfg = config.blastdan.services.vscode-server;
in
{
  options.blastdan.services.vscode-server = with types; {
    enable = mkBoolOpt false "Whether or not to enable vscode-server.";
  };

  config = mkIf cfg.enable {
    services.vscode-server.enable = true;
  };
}
