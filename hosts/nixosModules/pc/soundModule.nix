{ pkgs, lib, config, ... }:

{
  options = {
    soundModule.enable = 
      lib.mkEnableOption "enables sound module";

    soundModule.gui =
      lib.mkEnableOption "sets up some GUI controls for sound";
  };

  config = lib.mkIf config.soundModule.enable {
    hardware.pulseaudio.enable = false;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };

    home.packages = with pkgs; [
      pavucontrol
      pamixer
    ];
  };
}
