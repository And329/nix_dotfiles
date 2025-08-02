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
        theme = "solarized-dark";
      };
    
      };
    };
  };

  home.activation.i3statusRustConfig = lib.hm.dag.entryAfter ["writeBoundary"] ''
    if [ -f "$HOME/.config/i3status-rust/config-default.toml" ]; then
      cp "$HOME/.config/i3status-rust/config-default.toml" "$HOME/.config/i3status-rust/config.toml"
    fi
  '';

  home.stateVersion = "25.05";
}
