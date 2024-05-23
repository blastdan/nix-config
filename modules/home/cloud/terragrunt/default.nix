{ lib, config, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.blastdan) enabled;

  cfg = config.blastdan.cloud.terragrunt;
in
{
  options.blastdan.cloud.terragrunt = {
    enable = mkEnableOption "terragrunt";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      terragrunt
    ];
    programs.zsh.shellAliases = {
      tg = "terragrunt";
      tga = "terragrunt apply";
      tgc = "terragrunt console";
      tgd = "terragrunt destroy";
      tgf = "terragrunt fmt";
      tgg = "terragrunt graph";
      tgim = "terragrunt import";
      tgin = "terragrunt init";
      tgo = "terragrunt output";
      tgp = "terragrunt plan";
      tgpr = "terragrunt providers";
      tgr = "terragrunt refresh";
      tgsh = "terragrunt show";
      tgt = "terragrunt taint";
      tgut = "terragrunt untaint";
      tgv = "terragrunt validate";
      tgw = "terragrunt workspace";
      tgs = "terragrunt state";
      tgfu = "terragrunt force-unlock";
      tgwst = "terragrunt workspace select";
      tgwsw = "terragrunt workspace show";
      tgssw = "terragrunt state show";
      tgwde = "terragrunt workspace delete";
      tgwls = "terragrunt workspace list";
      tgsls = "terragrunt state list";
      tgwnw = "terragrunt workspace new";
      tgsmv = "terragrunt state mv";
      tgspl = "terragrunt state pull";
      tgsph = "terragrunt state push";
      tgsrm = "terragrunt state rm";
      tgay = "terragrunt apply -auto-approve";
      tgdy = "terragrunt destroy -auto-approve";
      tginu = "terragrunt init -upgrade";
      tgpde = "terragrunt plan --destroy";
    };
  };
}
