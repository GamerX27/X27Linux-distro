#!/bin/bash
set -e

echo "== Fedora KDE Minimal Install + GUI Debranding =="

# Root check
if [ "$EUID" -ne 0 ]; then
  echo "Run this script as root."
  exit 1
fi

echo "[1/6] Updating base system..."
dnf upgrade -y

echo "[2/6] Installing KDE Plasma Minimal Workspace..."
dnf groupinstall -y "KDE Plasma Workspaces" \
  --setop=group_package_types=mandatory,default

echo "[3/6] Installing essential KDE tools..."
dnf install -y \
  konsole dolphin kwrite sddm xorg-x11-server-Xorg plasma-workspace

echo "[4/6] Disabling Fedora GUI branding..."
# Replace Fedora wallpapers and logos
dnf install -y generic-logos

# Optional: override boot splash and SDDM branding
mkdir -p /etc/sddm.conf.d/
cat > /etc/sddm.conf.d/debrand.conf <<EOF
[Theme]
Current=breeze

[General]
InputMethod=
EOF

# Optionally replace plymouth theme (boot splash)
plymouth-set-default-theme -R details

echo "[5/6] Enabling graphical target and SDDM..."
systemctl set-default graphical.target
systemctl enable sddm

echo "[6/6] Cleaning up bloat..."
dnf remove -y \
  libreoffice* akonadi* kmail* korganizer* kontact* \
  plasma-discover* calligra* elisa-player dragonplayer \
  firefox kde-connect kamoso kwalletmanager kget \
  kde-print-manager || true

dnf autoremove -y
dnf clean all

echo "✅ Done. Reboot and enjoy your clean, minimal KDE setup!"
