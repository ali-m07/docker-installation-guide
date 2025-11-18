#!/bin/bash

# Docker Installation Script for macOS
# This script installs Docker Desktop on macOS using Homebrew

set -e

echo "🐳 Docker Installation Script for macOS"
echo "========================================"
echo ""

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "❌ Homebrew is not installed."
    echo "Please install Homebrew first: https://brew.sh"
    exit 1
fi

echo "✅ Homebrew found"
echo ""

# Install Docker Desktop
echo "📦 Installing Docker Desktop..."
brew install --cask docker

echo ""
echo "✅ Docker Desktop installed successfully!"
echo ""
echo "🚀 Starting Docker Desktop..."
open -a Docker

echo ""
echo "⏳ Waiting for Docker to start (this may take a minute)..."
sleep 10

# Wait for Docker to be ready
echo "🔍 Checking Docker status..."
for i in {1..30}; do
    if docker info &> /dev/null; then
        echo "✅ Docker is running!"
        break
    fi
    echo "   Waiting for Docker to be ready... ($i/30)"
    sleep 2
done

# Verify installation
echo ""
echo "🔍 Verifying installation..."
if docker --version &> /dev/null; then
    echo "✅ Docker version: $(docker --version)"
else
    echo "⚠️  Docker command not found. Please restart your terminal or check Docker Desktop."
    exit 1
fi

if docker compose version &> /dev/null; then
    echo "✅ Docker Compose version: $(docker compose version)"
fi

# Test with hello-world
echo ""
echo "🧪 Testing Docker with hello-world container..."
if docker run --rm hello-world &> /dev/null; then
    echo "✅ Docker is working correctly!"
else
    echo "⚠️  Docker test failed. Please check Docker Desktop status."
fi

echo ""
echo "🎉 Installation complete!"
echo ""
echo "Next steps:"
echo "  1. Docker Desktop should be running in your menu bar"
echo "  2. Try running: docker run hello-world"
echo "  3. Check Docker status: docker info"

