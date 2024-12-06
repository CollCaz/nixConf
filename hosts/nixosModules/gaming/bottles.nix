{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bottles
    mangohud
  ];
}
