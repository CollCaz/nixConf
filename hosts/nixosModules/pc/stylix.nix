{ pkgs, ... }:

{
  stylix = {
    image = ./gruvbox_castle.png;
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";

    fonts = {
      sansSerif = {
        package = pkgs.fira-go;
        name = "FiraGo";
      };
      monoSpace = {
        package = pkgs.fira-code-nerdfont;
        name = "Fira Mono Code NerdFont";
      };
    };
  };
}
