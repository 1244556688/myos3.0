{ config, pkgs, ... }:

{
  # LuminaOS - Core Configuration
  system.stateVersion = "24.05";

  # Networking
  networking.hostName = "luminaos";
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Taipei";

  # Select internationalisation properties.
  i18n.defaultLocale = "zh_TW.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "zh_TW.UTF-8";
    LC_IDENTIFICATION = "zh_TW.UTF-8";
    LC_MEASUREMENT = "zh_TW.UTF-8";
    LC_MONETARY = "zh_TW.UTF-8";
    LC_NAME = "zh_TW.UTF-8";
    LC_NUMERIC = "zh_TW.UTF-8";
    LC_PAPER = "zh_TW.UTF-8";
    LC_TELEPHONE = "zh_TW.UTF-8";
    LC_TIME = "zh_TW.UTF-8";
  };

  # Graphics & Display Server
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Audio (Pipewire for professional sound)
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # User Account (Auto-login for Live ISO)
  users.users.luminauser = {
    isNormalUser = true;
    description = "Lumina User";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
    initialPassword = "lumina"; # Minimalist password
  };

  # Auto-login
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "luminauser";

  # Nix Settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
