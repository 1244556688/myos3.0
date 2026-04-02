{ config, pkgs, ... }:

{
  # LuminaOS - Software Suite & Programming Tools
  environment.systemPackages = with pkgs; [
    # Core Apps
    firefox
    haruna # Modern Media Player
    dolphin # File Explorer (from KDE)
    ark # Archiver
    kate # Text Editor
    
    # Graphics & Aesthetics
    libsForQt5.qtstyleplugin-kvantum
    kdePackages.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    kdePackages.qt6ct
    fluent-icon-theme
    layan-kde # A beautiful glassmorphism theme
    
    # Programming Tools (User Requested)
    vscode
    git
    python3
    nodejs_20
    alacritty # Fast, modern terminal
    gnumake
    binutils
    gcc
    
    # Utilities
    neofetch
    btop
    wget
    curl
  ];

  # Allow Unfree Software (e.g., VS Code)
  nixpkgs.config.allowUnfree = true;

  # Fonts (Premium Minimalism)
  fonts.packages = with pkgs; [
    inter
    roboto
    jetbrains-mono
    noto-fonts
    noto-fonts-cjk-sans
    font-awesome
  ];
}
