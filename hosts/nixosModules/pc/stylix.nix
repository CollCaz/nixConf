{ pkgs, ... }:

{
  stylix = {
    image = ./gruvbox_castle.png;
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
  };
}
