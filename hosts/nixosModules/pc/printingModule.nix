{ lib, config, ... }:

{
  options = {
    printingModule.enable =
      lib.mkEnableOption "enables printing module";
  };

  config = lib.mkIf config.printingModule.enable {
    services.printing.enable = true;
  };

  #TODO: add more printing utilities.
}
