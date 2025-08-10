{ config, pkgs, ... }:

{
  # ============================================================================
  # i3 WINDOW MANAGER CONFIGURATION
  # ============================================================================
  # test change
  # i3 window manager setup
  services.xserver.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;  # Use i3-gaps for additional features
    extraPackages = with pkgs; [
      # Core i3 utilities
      dmenu          # Application launcher
      rofi           # Alternative application launcher
      i3lock         # Screen locker
      
      # Status bar
      i3status-rust  # Rust-based status bar
      
      # Wallpaper and appearance
      feh            # Wallpaper setter
      
      # Terminal
      alacritty      # GPU-accelerated terminal
    ];
  };

  # ============================================================================
  # DISPLAY MANAGER CONFIGURATION
  # ============================================================================
  
  # Display manager settings
  services.xserver.displayManager = {
    defaultSession = "none+i3";
    lightdm.enable = true;
  };

  # ============================================================================
  # SYSTEM PACKAGES
  # ============================================================================
  
  # Additional system packages for i3 environment
  environment.systemPackages = with pkgs; [
    # Audio control
    pavucontrol        # PulseAudio volume control
    
    # Network management
    networkmanagerapplet  # NetworkManager system tray applet
    
    # File management
    pcmanfm           # Lightweight file manager
    
    # Screenshots
    scrot             # Screenshot utility
    flameshot         # Advanced screenshot tool
    
    # System monitoring
    htop              # Process monitor
    
    # Clipboard management
    xclip             # Command line clipboard
    
    # Brightness control (for laptops)
    brightnessctl     # Backlight control
    
    # Bluetooth management
    blueman           # Bluetooth manager
  ];

  # ============================================================================
  # SYSTEM SERVICES
  # ============================================================================
  
  # Network management
  programs.nm-applet.enable = true;
  
  # Bluetooth support
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
}