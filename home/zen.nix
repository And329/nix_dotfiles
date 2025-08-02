{ config, pkgs, ... }:

{
  home.username = "zen";
  home.homeDirectory = "/home/zen";

  programs.zsh.enable = true;
  programs.git = {
    enable = true;
    userName = "zen";
    userEmail = "329@riseup.net";
  };

  home.stateVersion = "25.05";
}
