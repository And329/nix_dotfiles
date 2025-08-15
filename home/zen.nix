{ config, pkgs, ... }:

{
  imports = [
    ../modules/i3.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "zen";
  home.homeDirectory = "/home/zen";

  # This value determines the Home Manager release which your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Packages to install
  home.packages = with pkgs; [
    alacritty
    i3status-rust
    dmenu
    i3lock
    feh
    rofi
    firefox
    git
    htop
    tree
    unzip
    zip
    # Font for terminal and i3
    nerd-fonts.fira-code
  ];

  # Alacritty terminal configuration
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = {
          x = 10;
          y = 10;
        };
        opacity = 0.9;
      };
      font = {
        normal = {
          family = "FiraCode Nerd Font";
          style = "Regular";
        };
        size = 12;
      };
      colors = {
        primary = {
          background = "#1e1e1e";
          foreground = "#d4d4d4";
        };
        normal = {
          black = "#1e1e1e";
          red = "#f44747";
          green = "#608b4e";
          yellow = "#dcdcaa";
          blue = "#569cd6";
          magenta = "#c678dd";
          cyan = "#56b6c2";
          white = "#d4d4d4";
        };
      };
    };
  };

  # Git configuration
  programs.git = {
    enable = true;
    userName = "And329";
    userEmail = "329@riseup.net";
  };

  # Bash configuration
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      export EDITOR=vim
      alias ll='ls -la'
      alias la='ls -A'
      alias l='ls -CF'
    '';
  };
}
