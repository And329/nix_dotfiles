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
  programs.i3status-rust = {
    enable = true;
    bars = {
      default = {
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
          theme = {
            name = "solarized-dark";
          };
        };
      };
    };
  };

}
