# LuminaOS ISO Build Script (Windows)
# This script uses Docker to build the NixOS ISO image.

$ISO_NAME = "LuminaOS-v1.0.iso"
$CWD = Get-Location

Write-Host "--- LuminaOS Build Tool v1.0 ---" -ForegroundColor Cyan
Write-Host "Building: $ISO_NAME"
Write-Host "Target: Standalone Bootable ISO"

# Check if Docker is installed
if (!(Get-Command docker -ErrorAction SilentlyContinue)) {
    Write-Error "Docker is required to build the ISO on Windows. Please install Docker Desktop and restart."
    exit
}

# Run the Nix builder container
# Using a lightweight NixOS image to build our custom ISO
Write-Host "Starting Nix Docker environment..." -ForegroundColor Yellow

docker run --rm -v "${CWD}/nixos:/tmp/nixos" -w /tmp/nixos nixos/nix:latest bash -c "
    nix-channel --add https://nixos.org/channels/nixos-24.05 nixos && \
    nix-channel --update && \
    nix-build '<nixpkgs/nixos/release.nix>' -A iso_minimal.x86_64-linux --arg configuration ./iso.nix -o /tmp/nixos/result
"

if ($LASTEXITCODE -eq 0) {
    Write-Host "Build Successful!" -ForegroundColor Green
    Write-Host "The ISO image will be available in the 'result/' directory."
} else {
    Write-Host "Build Failed. Please check the logs above." -ForegroundColor Red
}
