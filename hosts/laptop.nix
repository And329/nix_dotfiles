{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../modules/i3.nix
  ];

  nixpkgs.config.allowUnfree = true;

  networking.hostName = "laptop";
  time.timeZone = "Europe/Moscow";

  users.users.zen = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  # Enable NetworkManager for network management
  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    git
    wget
    curl
    firefox
    pavucontrol
    neofetch
    # Calendar app for i3status-rs
    gnome-calendar
    # Additional useful tools
    htop
    tree
    unzip
  ];

  # X Server configuration
  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = false;
    desktopManager.xterm.enable = false;
    libinput.enable = true;
  };

  # Audio provider (PipeWire is recommended for NixOS 25.05+)
  services.pipewire = {
    enable = true;
    audio.enable = true;
    pulse.enable = true;
    alsa.enable = true;
    jack.enable = true;
  };

  # Boot loader (UEFI, systemd-boot)
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "25.05";
}
