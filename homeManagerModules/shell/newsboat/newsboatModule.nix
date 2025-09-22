{pkgs, config, lib, ...}:
{
  options = {
    newsboatModule.enable = lib.mkEnableOption "enables newsboat";
  };

  config = lib.mkIf config.newsboatModule.enable {
    programs.newsboat = {
      enable = true;
      browser = "${pkgs.brave}";

      urls = [
        {
          tags = [
            "videos"
            "youtube"
            "educational"
            "entertainment"
          ];
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCOT2iLov0V7Re7ku_3UBtcQ";
        }
      ];
    };
  };
}
