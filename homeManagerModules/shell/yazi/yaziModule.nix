{ pkgs, lib, config, ... }:

{
  options = {
    yaziModule = {
      enable = 
        lib.mkEnableOption "enables yazi";

      fishIntegration =
        lib.mkEnableOption "enables fish integration";
    };
  };
  config = lib.mkIf config.yaziModule.enable {
    xdg = {
      enable = true;
      mime.enable = true;

      desktopEntries = {
        yazi = {
          categories = [
            "System"
            "FileManager"
            "FileTools"
            "ConsoleOnly"
          ];
          exec = "kitty -T yazi --exec yazi";
          genericName = "file explorer";
          mimeType = [
            "inode/directory"
          ];
          name = "Yazi";
          terminal = false;
          # keywords = [
          #   "File"
          #   "Manager"
          #   "Explorer"
          #   "Launcher"
          #   "Browser"
          # ];
        };
      };

      mimeApps = {
        enable = true;

        defaultApplications = {
        "inode/directory" = ["yazi.desktop"];
        "image/png" = ["yazi.desktop"];
        "image/jpg" = ["yazi.desktop"];
        };
      };
    };
    home = {
      packages = with pkgs; [
        yazi
        ripdrag
      ];

      file = {
        ".config/yazi".source = ./yaziConfig;
      };
    };
    programs.fish = lib.mkIf config.yaziModule.fishIntegration {
      enable = true;

      functions = {
        yy = {
          body = ''
            set tmp (mktemp -t "yazi-cwd.XXXXXX")
            yazi $argv --cwd-file="$tmp"
            if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
              cd -- "$cwd"
            end
            rm -f -- "$tmp"
          '';
        };
      };
    };
  };
}
