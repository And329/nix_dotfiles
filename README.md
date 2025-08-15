# NixOS Configuration with Flakes and Home Manager

A modern NixOS configuration using flakes and home-manager with i3 window manager, Alacritty terminal, and i3status-rust status bar.

## Structure

```
.
├── flake.nix                 # Main flake configuration
├── hosts/
│   └── laptop.nix           # NixOS system configuration
├── home/
│   └── zen.nix              # Home Manager user configuration
├── modules/
│   └── i3.nix               # i3 window manager configuration
└── i3status-rs.toml         # i3status-rust configuration
```

## Features

- **Window Manager**: i3 with custom keybindings and theming
- **Terminal**: Alacritty with VS Code Dark+ color scheme
- **Status Bar**: i3status-rust with system monitoring
- **Package Management**: Nix flakes with home-manager
- **Audio**: PipeWire for modern audio handling
- **Network**: NetworkManager for wireless connectivity

## Installation

1. **Generate hardware configuration**:
   ```bash
   sudo nixos-generate-config --root /mnt
   cp /mnt/etc/nixos/hardware-configuration.nix hosts/
   ```

2. **Build and switch**:
   ```bash
   sudo nixos-rebuild switch --flake .#laptop
   ```

3. **Copy i3status-rust config**:
   ```bash
   mkdir -p ~/.config/i3status-rust
   cp i3status-rs.toml ~/.config/i3status-rust/config.toml
   ```

## Key Bindings

| Key Combination | Action |
|----------------|--------|
| `Super + Enter` | Open Alacritty terminal |
| `Super + d` | Open application launcher (rofi) |
| `Super + Shift + q` | Close window |
| `Super + h/j/k/l` | Navigate windows (vim-style) |
| `Super + Shift + h/j/k/l` | Move windows |
| `Super + 1-0` | Switch to workspace |
| `Super + Shift + 1-0` | Move window to workspace |
| `Super + f` | Toggle fullscreen |
| `Super + Shift + x` | Lock screen |

## Customization

### Network Interface
Update the network device in `i3status-rs.toml` to match your system:
```toml
[[block]]
block = "net"
device = "your-interface-name"  # Check with 'ip link'
```

### User Configuration
Update user details in `home/zen.nix`:
```nix
programs.git = {
  userName = "Your Name";
  userEmail = "your.email@example.com";
};
```

### Timezone and Locale
Modify timezone and locale settings in `hosts/laptop.nix` as needed.

## Troubleshooting

- **Missing hardware-configuration.nix**: Generate it with `nixos-generate-config`
- **Network issues**: Ensure NetworkManager is enabled and your interface name is correct
- **Audio not working**: Check PipeWire service status with `systemctl --user status pipewire`
- **i3status-rust not showing**: Verify config file location and permissions

## Dependencies

All dependencies are managed through Nix. The configuration includes:
- i3 window manager
- Alacritty terminal
- i3status-rust
- rofi application launcher
- Firefox browser
- Essential system tools
