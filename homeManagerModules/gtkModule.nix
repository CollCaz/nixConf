{ pkgs, ... }:

{
  gtk = {
    enable = true;
    theme = {
      package = pkgs.gruvbox-gtk-theme;
      name = "Gruvbox-dark-standard-pink-black";
    };
    # iconTheme = {
    #   package = pkgs.gruvbox-plus-icons;
    #   name = "Gruvbox-Plus-Dark";
    # };
  };
}
