{ channels, ... }:

final: prev:

{
  inherit (channels.unstable) k9s;
}