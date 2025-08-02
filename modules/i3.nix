{ config, pkgs, ... }:

{
  services.xserver.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    extraPackages = with pkgs; [
      dmenu
      i3status-rust
      i3lock
      feh
      rofi
      alacritty
    ];
  };

  services.xserver.displayManager.defaultSession = "none+i3";
  services.xserver.displayManager.lightdm.enable = true;

  environment.systemPackages = with pkgs; [
    i3-gaps
    i3status-rust
    i3lock
    feh
    rofi
    alacritty
    dmenu
    pavucontrol
    networkmanagerapplet
    blueman
  ];

  programs.nm-applet.enable = true;
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
}