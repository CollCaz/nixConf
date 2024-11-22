{ lib, config, ... }:

{
  options = {
    soundModule.enable = 
      lib.mkEnableOption "enables sound module";
  };

  config = lib.mkIf config.soundModule.enable {
    hardware.pulseaudio.enable = false;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };
  };
}
