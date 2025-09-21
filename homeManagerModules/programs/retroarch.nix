{ pkgs, ... }:
{
  home.packages = [
    (pkgs.retroarch.withCores (cores: with cores; [
      pcsx2
      beetle-gba
    ]))
  ];
}
