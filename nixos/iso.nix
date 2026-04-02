{ config, pkgs, ... }:

{
  imports = [
    <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-graphical-plasma5-new-kernel.nix>
    ./configuration.nix
    ./apps.nix
  ];

  # Force Plasma 6 (ISO default might be 5)
  services.desktopManager.plasma6.enable = true;

  # Custom ISO Metadata
  isoImage.isoName = "LuminaOS-v1.0.iso";
  isoImage.volumeID = "LUMINAOS";

  # Remove ISO helper contents for a cleaner "Modern OS" feel
  isoImage.makeEfiBootable = true;
  isoImage.makeUsbBootable = true;

  # Installer-less feel: Skip the graphical installer and just boot to desktop
  system.activationScripts.removeInstaller = {
    text = ''
      rm -f /home/luminauser/Desktop/install-nixos.desktop
    '';
  };

  # Visual Tweaks: Set wallpaper for the user
  # (Note: In a real system, you'd provide the file, here I'll use a Nix function to fetch a beautiful minimalist gradient)
  # wallpaper.source = pkgs.fetchurl { ... };
}
