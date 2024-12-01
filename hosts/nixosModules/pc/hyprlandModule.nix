{ pkgs, lib, config, ... }:

{
  options = {
   hyprlandModule.enable = 
      lib.mkEnableOption "enables hyprland";
  };

  config = lib.mkIf config.hyprlandModule.enable {
    programs.hyprland.enable = true;

    services.gnome.gnome-keyring.enable = true;
    environment.systemPackages = with pkgs; [
      cliphist
      dunst
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
