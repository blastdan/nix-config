{ options, config, lib, pkgs, ... }:

with lib;
with lib.blastdan;
let
  cfg = config.blastdan.apps.yubikey;
in
{
  options.blastdan.apps.yubikey = with types; {
    enable = mkBoolOpt false "Whether or not to enable Yubikey.";
  };

  config = mkIf cfg.enable {
    services.yubikey-agent.enable = true;
    environment.systemPackages = with pkgs; [ yubikey-manager-qt ];
  };
}
