{ lib, config, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.blastdan) enabled;

  cfg = config.blastdan.cloud.gcloud;
in
{
  options.blastdan.cloud.gcloud = {
    enable = mkEnableOption "gcloud";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      (google-cloud-sdk.withExtraComponents [
        google-cloud-sdk.components.gke-gcloud-auth-plugin
        google-cloud-sdk.components.nomos
      ])
    ];
  };
}
