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

      mimeApps = {
        enable = true;

        defaultApplications = {
          "inode/directory" = [ "yazi.desktop" ];
          "image/png" = [ "yazi.desktop" ];
          "image/jpg" = [ "yazi.desktop" ];
        };
      };
    };
    home = {
      packages = with pkgs; [
        yazi
        ripdrag
      ];

      file = {
        ".config/yazi".recursive = true;
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
