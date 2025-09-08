{ pkgs, ... }:
{
  programs.retroarch= {
    enable = true;
    package = pkgs.retroarch.override {
      cores = with pkgs.libreto; [
        pcsx2
      ];
    };
  };
}
