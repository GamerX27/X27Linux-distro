#!/bin/bash
set -e

echo "== Fedora KDE Minimal Install + GUI Debranding =="

# Root check
if [ "$EUID" -ne 0 ]; then
  echo "Run this script as root."
  exit 1
fi

echo "[1/6] Updating base system..."
dnf5 upgrade -y

echo "[2/6] Installing Minimal KDE Plasma Desktop..."
dnf5 install -y \
  plasma-desktop \
  sddm \
  konsole \
  dolphin \
  kwrite \
  xorg-x11-server-Xorg \
  plasma-workspace

echo "[3/6] Enabling graphical target and SDDM..."
systemctl set-default graphical.target
systemctl enable sddm

echo "[4/6] Replacing Fedora branding..."
dnf5 swap -y fedora-logos generic-logos

echo "[5/6] Debranding SDDM..."
mkdir -p /etc/sddm.conf.d/
cat > /etc/sddm.conf.d/debrand.conf <<EOF
[Theme]
Current=breeze

[General]
InputMethod=
EOF

# Optional: set neutral Plymouth boot splash
plymouth-set-default-theme -R details

echo "[6/6] Removing unneeded KDE bloat..."
dnf5 remove -y \
  libreoffice* \
  akonadi* \
  kmail* \
  korganizer* \
  kontact* \
#  plasma-discover* \
  calligra* \
  elisa-player \
  dragonplayer \
  firefox \
 # kde-connect \
  kamoso \
  kwalletmanager \
  kget \
#  kde-print-manager || true

dnf5 autoremove -y
dnf5 clean all

echo "✅ Done! Reboot and enjoy your minimal, debranded KDE Plasma."
