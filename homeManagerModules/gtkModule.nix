{ pkgs, ... }:

{
  gtk = {
    enable = true;
    theme = {
      package = pkgs.gruvbox-gtk-theme;
      name = "dark-standard-pink-black-Dark";
    };
    # iconTheme = {
    #   package = pkgs.gruvbox-plus-icons;
    #   name = "Gruvbox-Plus-Dark";
    # };
  };
}
