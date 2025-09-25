{pkgs, config, lib, ...}:
{
  options = {
    newsboatModule.enable = lib.mkEnableOption "enables newsboat";
  };

  config = lib.mkIf config.newsboatModule.enable {
    programs.fish = {
      shellAliases = {
        nb = "newsboat";
      };
    };

    programs.newsboat = {
      enable = true;
      browser = "${pkgs.brave}";
      extraConfig = ''
        macro v set browser "mpv --really-quiet --no-terminal %u" ; open-in-browser ; set browser "elinks %u"

        # Newsboat colour scheme to work with the Gruvbox palette
        # Inspired by the vim theme https://github.com/morhetz/gruvbox
        # Tested with the Kitty gruvbox terminal colour scheme
        # https://github.com/wdomitrz/kitty-gruvbox-theme

        color background          color223   color0
        color listnormal          color223   color0
        color listnormal_unread   color2     color0
        color listfocus           color223   color237
        color listfocus_unread    color223   color237
        color info                color8     color0
        color article             color223   color0

        # highlights
        highlight article "^(Feed|Link):.*$" color11 default bold
        highlight article "^(Title|Date|Author):.*$" color11 default bold
        highlight article "https?://[^ ]+" color2 default underline
        highlight article "\\[[0-9]+\\]" color2 default bold
        highlight article "\\[image\\ [0-9]+\\]" color2 default bold
        highlight feedlist "^─.*$" color6 color6 bold
      '';

      urls = [
         {
          title = "Hank Green";
          tags = [
            "videos"
            "youtube"
            "educational"
            "entertainment"
            "vlog"
          ];
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCOT2iLov0V7Re7ku_3UBtcQ";
        }
        {
          title = "xkcd";
          tags = [
            "comics"
            "web-comics"
          ];
          url = "https://xkcd.com/atom.xml";
        }
        {
          title = "NixOS Announcements";
          tags = [
            "linux"
            "announcements"
            "nixOS"
            "tech"
          ];
          url = "https://nixos.org/blog/announcements-rss.xml";
        }
        {
          title = "Drew DeVualt";
          tags = [
            "linux"
            "tech"
            "folks"
            "blog"
            "random thoughts"
          ];
          url = "https://drewdevault.com/blog/index.xml";
        }
        {
          title = "Harry Kenya";
          tags = [
            "cars"
            "videos"
            "vlog"
            "diy"
          ];
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCfUdIRQRRYiCiuuQ6_9k-DA";
        }
        {
          title = "Anton Petrov";
          tags = [
            "videos"
            "youtube"
            "educational"
            "entertainment"
          ];
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCciQ8wFcVoIIMi-lfu8-cjQ";
        }
      ];
    };
  };
}
