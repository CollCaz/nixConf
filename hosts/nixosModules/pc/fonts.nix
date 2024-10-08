{ pkgs, lib, config, ... }:

{
  options = {
    fontsModule.enable = 
      lib.mkEnableOption "enables fonts module";
  };

  config = lib.mkIf config.fontsModule.enable {
    fonts = {
      enableDefaultPackages = true;
      packages = with pkgs; [
        nerdfonts
        fira-go
        fira
        roboto-slab
      ];
      
      fontconfig = {
        defaultFonts = {
          serif = [ "roboto-slab" "nerdfonts" ];
          sansSerif = [ "fira-go" "fira" "nerdfonts" ];
          monospace = [ "fira-code" "nerdfonts"];
        };
      };
    };
  };
}
