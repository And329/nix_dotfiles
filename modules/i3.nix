{ config, pkgs, ... }:

{
  # i3 window manager configuration
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = "Mod4"; # Super key
      
      # Terminal
      terminal = "alacritty";
      
      # Menu
      menu = "rofi -show drun";
      
      # Fonts
      fonts = {
        names = [ "FiraCode Nerd Font" ];
        size = 10.0;
      };
      
      # Key bindings
      keybindings = let
        modifier = config.xsession.windowManager.i3.config.modifier;
      in {
        # Basic bindings
        "${modifier}+Return" = "exec ${config.xsession.windowManager.i3.config.terminal}";
        "${modifier}+d" = "exec ${config.xsession.windowManager.i3.config.menu}";
        "${modifier}+Shift+q" = "kill";
        "${modifier}+Shift+c" = "reload";
        "${modifier}+Shift+r" = "restart";
        "${modifier}+Shift+e" = "exec i3-nagbar -t warning -m 'Do you want to exit i3?' -b 'Yes' 'i3-msg exit'";
        
        # Focus
        "${modifier}+h" = "focus left";
        "${modifier}+j" = "focus down";
        "${modifier}+k" = "focus up";
        "${modifier}+l" = "focus right";
        "${modifier}+Left" = "focus left";
        "${modifier}+Down" = "focus down";
        "${modifier}+Up" = "focus up";
        "${modifier}+Right" = "focus right";
        
        # Move windows
        "${modifier}+Shift+h" = "move left";
        "${modifier}+Shift+j" = "move down";
        "${modifier}+Shift+k" = "move up";
        "${modifier}+Shift+l" = "move right";
        "${modifier}+Shift+Left" = "move left";
        "${modifier}+Shift+Down" = "move down";
        "${modifier}+Shift+Up" = "move up";
        "${modifier}+Shift+Right" = "move right";
        
        # Split
        "${modifier}+b" = "split h";
        "${modifier}+v" = "split v";
        
        # Fullscreen
        "${modifier}+f" = "fullscreen toggle";
        
        # Layout
        "${modifier}+s" = "layout stacking";
        "${modifier}+w" = "layout tabbed";
        "${modifier}+e" = "layout toggle split";
        
        # Floating
        "${modifier}+Shift+space" = "floating toggle";
        "${modifier}+space" = "focus mode_toggle";
        
        # Workspaces
        "${modifier}+1" = "workspace number 1";
        "${modifier}+2" = "workspace number 2";
        "${modifier}+3" = "workspace number 3";
        "${modifier}+4" = "workspace number 4";
        "${modifier}+5" = "workspace number 5";
        "${modifier}+6" = "workspace number 6";
        "${modifier}+7" = "workspace number 7";
        "${modifier}+8" = "workspace number 8";
        "${modifier}+9" = "workspace number 9";
        "${modifier}+0" = "workspace number 10";
        
        # Move to workspace
        "${modifier}+Shift+1" = "move container to workspace number 1";
        "${modifier}+Shift+2" = "move container to workspace number 2";
        "${modifier}+Shift+3" = "move container to workspace number 3";
        "${modifier}+Shift+4" = "move container to workspace number 4";
        "${modifier}+Shift+5" = "move container to workspace number 5";
        "${modifier}+Shift+6" = "move container to workspace number 6";
        "${modifier}+Shift+7" = "move container to workspace number 7";
        "${modifier}+Shift+8" = "move container to workspace number 8";
        "${modifier}+Shift+9" = "move container to workspace number 9";
        "${modifier}+Shift+0" = "move container to workspace number 10";
        
        # Resize mode
        "${modifier}+r" = "mode resize";
        
        # Lock screen
        "${modifier}+Shift+x" = "exec i3lock -c 000000";
      };
      
      # Status bar
      bars = [
        {
          position = "top";
          statusCommand = "i3status-rs ~/.config/i3status-rust/config.toml";
          fonts = {
            names = [ "FiraCode Nerd Font" ];
            size = 10.0;
          };
          colors = {
            background = "#1e1e1e";
            statusline = "#d4d4d4";
            separator = "#666666";
            focusedWorkspace = {
              border = "#569cd6";
              background = "#569cd6";
              text = "#ffffff";
            };
            activeWorkspace = {
              border = "#333333";
              background = "#333333";
              text = "#ffffff";
            };
            inactiveWorkspace = {
              border = "#1e1e1e";
              background = "#1e1e1e";
              text = "#888888";
            };
            urgentWorkspace = {
              border = "#f44747";
              background = "#f44747";
              text = "#ffffff";
            };
          };
        }
      ];
      
      # Window settings
      window = {
        border = 2;
        titlebar = false;
      };
      
      # Colors
      colors = {
        focused = {
          border = "#569cd6";
          background = "#569cd6";
          text = "#ffffff";
          indicator = "#569cd6";
          childBorder = "#569cd6";
        };
        focusedInactive = {
          border = "#333333";
          background = "#333333";
          text = "#ffffff";
          indicator = "#333333";
          childBorder = "#333333";
        };
        unfocused = {
          border = "#1e1e1e";
          background = "#1e1e1e";
          text = "#888888";
          indicator = "#1e1e1e";
          childBorder = "#1e1e1e";
        };
        urgent = {
          border = "#f44747";
          background = "#f44747";
          text = "#ffffff";
          indicator = "#f44747";
          childBorder = "#f44747";
        };
      };
      
      # Startup applications
      startup = [
        { command = "feh --bg-scale ~/.config/wallpaper.jpg"; always = true; notification = false; }
      ];
    };
  };
}
