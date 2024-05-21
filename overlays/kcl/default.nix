{ channels, ... }:

final: prev:

{
  inherit (channels.unstable) kcl-cli;
}