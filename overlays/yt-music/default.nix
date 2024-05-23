{ channels, ... }:

final: prev: {
  blastdan = (prev.blastdan or { }) // {
    yt-music = prev.makeDesktopItem {
      name = "YT Music";
      desktopName = "YT Music";
      genericName = "Music, from YouTube.";
      exec = ''
        ${final.google-chrome}/bin/google-chrome-stable "https://music.youtube.com/?blastdan.app=true" --profile-directory="Default"'';
      icon = ./icon.svg;
      type = "Application";
      categories = [ "AudioVideo" "Audio" "Player" ];
      terminal = false;
    };
  };
}
