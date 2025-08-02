{ config, pkgs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
    ../../modules/i3.nix
  ];

  nixpkgs.config.allowUnfree = true;

  networking.hostName = "nixos-desktop";
  time.timeZone = "Europe/Moscow";

  users.users.zen = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  environment.systemPackages = with pkgs; [
    vim git wget curl
  ];

  # X Server configuration
  services.xserver = {
    enable = true;
    # Disable default GNOME desktop
    desktopManager.gnome.enable = false;
    # Disable default xterm
    desktopManager.xterm.enable = false;
    # Enable touchpad support
    libinput.enable = true;
  };

  system.stateVersion = "25.05";
}
