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

  environment.systemPackages = with pkgs; [
    vim git wget curl
    firefox
    pavucontrol
  ];

  # X Server configuration
  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = false;
    desktopManager.xterm.enable = false;
    libinput.enable = true;
  };

  # Audio provider
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  # For PipeWire (recommended for NixOS 25.05+)
  services.pipewire = {
    enable = true;
    audio.enable = true;
    pulse.enable = true;
    alsa.enable = true;
    jack.enable = true;
  };

  # Boot loader (required for NixOS to boot)
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda"; # Change this if your disk is different

  system.stateVersion = "25.05";
}
