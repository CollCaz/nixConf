{ pkgs, lib, config, ... }:

{
  options = {
   hyprlandModule.enable = 
      lib.mkEnableOption "enables hyprland";
  };

  config = lib.mkIf config.hyprlandModule.enable {
    programs.hyprland.enable = true;

    environment.systemPackages = with pkgs; [
      cliphist
      dunst
      gnome.gnome-keyring
      hyprshot
      libnotify
      lxqt.lxqt-policykit
      satty
      wev
      wl-clipboard
      xdg-desktop-portal-hyprland
    ];
  };
}
