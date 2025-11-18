#!/bin/bash

# Docker Installation Script for Linux
# This script installs Docker Engine on Linux using the official Docker installation script

set -e

echo "🐳 Docker Installation Script for Linux"
echo "========================================"
echo ""

# Check if running as root
if [ "$EUID" -eq 0 ]; then
    echo "❌ Please do not run this script as root."
    echo "The script will use sudo when needed."
    exit 1
fi

# Detect Linux distribution
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
    VER=$VERSION_ID
else
    echo "❌ Cannot detect Linux distribution"
    exit 1
fi

echo "📋 Detected OS: $OS $VER"
echo ""

# Download and run Docker installation script
echo "📥 Downloading Docker installation script..."
curl -fsSL https://get.docker.com -o /tmp/get-docker.sh

echo "🔧 Installing Docker..."
sudo sh /tmp/get-docker.sh

# Add current user to docker group
echo ""
echo "👤 Adding user to docker group..."
sudo usermod -aG docker $USER

# Start Docker service (if systemd is available)
if command -v systemctl &> /dev/null; then
    echo "🚀 Starting Docker service..."
    sudo systemctl start docker
    sudo systemctl enable docker
fi

# Clean up
rm -f /tmp/get-docker.sh

echo ""
echo "✅ Docker installed successfully!"
echo ""
echo "⚠️  IMPORTANT: You need to log out and log back in for group changes to take effect."
echo "   Or run: newgrp docker"
echo ""

# Verify installation
echo "🔍 Verifying installation..."
if docker --version &> /dev/null; then
    echo "✅ Docker version: $(docker --version)"
else
    echo "⚠️  Docker command not found. Please log out and log back in."
    exit 1
fi

if docker compose version &> /dev/null; then
    echo "✅ Docker Compose version: $(docker compose version)"
fi

echo ""
echo "🧪 Testing Docker with hello-world container..."
echo "   (This requires logging out/in first if you haven't done so)"
if docker run --rm hello-world &> /dev/null 2>&1; then
    echo "✅ Docker is working correctly!"
else
    echo "⚠️  Docker test failed. Please log out and log back in, then run:"
    echo "   docker run hello-world"
fi

echo ""
echo "🎉 Installation complete!"
echo ""
echo "Next steps:"
echo "  1. Log out and log back in (or run: newgrp docker)"
echo "  2. Verify: docker run hello-world"
echo "  3. Check Docker status: docker info"

