{ pkgs, ... }:

{
  gtk = {
    enable = true;
    theme = {
      package = pkgs.gruvbox-gtk-theme;
      name = "gruvbox-gtk-theme-dark-standard-pink-black-Dark";
    };
    # iconTheme = {
    #   package = pkgs.gruvbox-plus-icons;
    #   name = "Gruvbox-Plus-Dark";
    # };
  };
}
