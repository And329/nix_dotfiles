{ config, pkgs, ... }:

{
  # Enable i3 window manager
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

  # Configure i3status-rust
  programs.i3status-rust = {
    enable = true;
    bars.default = {
      blocks = [
        {
          block = "disk_space";
          path = "/";
          info_type = "available";
          interval = 60;
          warning = 20.0;
          alert = 10.0;
        }
        { block = "memory"; }
        { block = "cpu"; interval = 1; }
        { block = "load"; interval = 1; }
        { block = "time"; interval = 60; format = "%a %d/%m %R"; }
      ];
      settings = {
        theme = "solarized-dark";
      };
    };
  };

  # Set i3 as the default window manager
  services.xserver.displayManager.defaultSession = "none+i3";

  # Enable lightdm display manager
  services.xserver.displayManager.lightdm.enable = true;

  # Add i3 and related packages to system packages
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

  # Enable NetworkManager applet
  programs.nm-applet.enable = true;

  # Enable bluetooth support
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
}