{ config, pkgs, ... }:

{
  # User settings
  home.username = "zen";
  home.homeDirectory = "/home/zen";
  home.stateVersion = "25.05";

  # Shell and git
  programs.zsh.enable = true;
  programs.git = {
    enable = true;
    userName = "zen";
    userEmail = "329@riseup.net";
  };

  # i3status-rust configuration
  programs.i3status-rs = {
    enable = true;
    configFile = ./i3status-rs.toml;
  };

}
