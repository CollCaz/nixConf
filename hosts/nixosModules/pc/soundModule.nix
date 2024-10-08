{ lib, config, ... }:

{
  options = {
    soundModule.enable = 
      lib.mkEnableOption "enables sound module";
  };

  config = lib.mkIf config.soundModule.enable {
    sound.enable = true;
    hardware.pulseaudio.enable = false;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };
  };
}
