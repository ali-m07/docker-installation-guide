# Docker Installation Guide

A comprehensive guide for installing Docker on macOS, Linux, and Windows with simple, quick commands.

## 📋 Table of Contents

- [Overview](#overview)
- [Quick Installation](#quick-installation)
- [Platform-Specific Guides](#platform-specific-guides)
  - [macOS](#macos)
  - [Linux](#linux)
  - [Windows](#windows)
- [Verification](#verification)
- [Next Steps: Install n8n](#next-steps-install-n8n)
- [Troubleshooting](#troubleshooting)
- [Additional Resources](#additional-resources)

## Overview

Docker is a platform for developing, shipping, and running applications using containerization. This repository provides simple, step-by-step installation instructions for Docker on different operating systems.

> 💡 **After installing Docker**, check out our [n8n setup guide](https://github.com/ali-m07/n8n) to automate workflows and tasks with ease!

## Quick Installation

### macOS
```bash
# Using Homebrew (Recommended)
brew install --cask docker

# Or download from Docker Desktop website
open https://www.docker.com/products/docker-desktop
```

### Linux (Ubuntu/Debian)
```bash
# Quick install script
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```

### Windows
Download and install Docker Desktop from: https://www.docker.com/products/docker-desktop

For detailed instructions, see the [platform-specific guides](#platform-specific-guides) below.

## Platform-Specific Guides

### macOS

#### Method 1: Using Homebrew (Recommended)
```bash
# Install Docker Desktop
brew install --cask docker

# Start Docker Desktop
open -a Docker
```

#### Method 2: Manual Installation
1. Download Docker Desktop for Mac from [docker.com](https://www.docker.com/products/docker-desktop)
2. Open the downloaded `.dmg` file
3. Drag Docker to Applications folder
4. Launch Docker from Applications
5. Follow the setup wizard

#### Post-Installation
```bash
# Add your user to docker group (if needed)
sudo dscl . -append /Groups/docker GroupMembership $(whoami)

# Verify installation
docker --version
docker run hello-world
```

### Linux

#### Ubuntu/Debian

**Quick Install (Recommended)**
```bash
# Download and run Docker installation script
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Add your user to docker group
sudo usermod -aG docker $USER

# Log out and log back in for group changes to take effect
```

**Manual Install**
```bash
# Update package index
sudo apt-get update

# Install prerequisites
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Add Docker's official GPG key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Set up repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Add user to docker group
sudo usermod -aG docker $USER
```

#### CentOS/RHEL/Fedora

**Quick Install**
```bash
# Download and run Docker installation script
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Start Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Add user to docker group
sudo usermod -aG docker $USER
```

**Manual Install (Fedora)**
```bash
# Install Docker
sudo dnf install -y docker docker-compose

# Start Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Add user to docker group
sudo usermod -aG docker $USER
```

#### Arch Linux
```bash
# Install Docker
sudo pacman -S docker docker-compose

# Start Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Add user to docker group
sudo usermod -aG docker $USER
```

### Windows

#### Requirements
- Windows 10 64-bit: Pro, Enterprise, or Education (Build 15063 or later)
- Windows 11 64-bit: Home or Pro version 21H2 or higher
- WSL 2 feature enabled
- Virtualization enabled in BIOS

#### Installation Steps

1. **Enable WSL 2**
   ```powershell
   # Run PowerShell as Administrator
   wsl --install
   ```

2. **Download Docker Desktop**
   - Visit: https://www.docker.com/products/docker-desktop
   - Download Docker Desktop for Windows

3. **Install Docker Desktop**
   - Run the installer
   - Follow the installation wizard
   - Restart your computer when prompted

4. **Launch Docker Desktop**
   - Start Docker Desktop from Start menu
   - Accept the terms of service
   - Complete the setup wizard

#### Post-Installation
```powershell
# Verify installation
docker --version
docker run hello-world
```

## Verification

After installation, verify Docker is working correctly:

```bash
# Check Docker version
docker --version

# Check Docker Compose version
docker compose version

# Run test container
docker run hello-world

# Check Docker daemon status
docker info
```

## Next Steps: Install n8n 🚀

Now that Docker is installed, you can easily set up **n8n** - a powerful workflow automation tool!

### What is n8n?

n8n is a free and open-source workflow automation tool that allows you to:
- 🤖 Automate tasks and workflows
- 🔗 Connect different services and APIs
- 📅 Schedule automated jobs
- 🔄 Create complex automation workflows
- 💼 Perfect for LinkedIn automation, data processing, and more!

### Quick Start with n8n

**Ready to automate?** Check out our comprehensive n8n setup guide:

👉 **[n8n Free Setup Repository](https://github.com/ali-m07/n8n)**

#### Super Quick Installation (After Docker is installed):

```bash
# Clone the n8n repository
git clone https://github.com/ali-m07/n8n.git
cd n8n

# Start n8n with Docker Compose (super easy!)
docker-compose up -d

# That's it! 🎉 n8n is now running on http://localhost:13000
```

**Default credentials:**
- Username: `admin`
- Password: `changeme`

#### What's Included in the n8n Repository?

- ✅ **Complete Docker setup** - One command to run everything
- ✅ **Free hosting options** - n8n Cloud, Oracle Cloud, and more
- ✅ **LinkedIn automation guides** - Step-by-step tutorials
- ✅ **Multiple deployment methods** - Choose what works best for you
- ✅ **Production-ready configuration** - Secure and optimized

#### Why Use n8n?

- 🆓 **100% Free** - Open source with free cloud tier available
- 🚀 **Easy Setup** - Works perfectly with Docker
- 🔌 **1000+ Integrations** - Connect to almost any service
- 📊 **Visual Workflow Builder** - No coding required
- ⚡ **Powerful Automation** - Handle complex workflows easily

**Perfect for:**
- Social media automation (LinkedIn, Twitter, etc.)
- Data processing and ETL workflows
- API integrations
- Scheduled tasks and notifications
- Business process automation

👉 **[Get Started with n8n →](https://github.com/ali-m07/n8n)**

---

## Troubleshooting

### macOS
- **Docker Desktop won't start**: Check System Preferences > Security & Privacy
- **Permission denied**: Ensure Docker Desktop is running and your user has permissions

### Linux
- **Permission denied**: Add your user to docker group and log out/in:
  ```bash
  sudo usermod -aG docker $USER
  newgrp docker
  ```
- **Docker daemon not running**: Start the service:
  ```bash
  sudo systemctl start docker
  sudo systemctl enable docker
  ```

### Windows
- **WSL 2 not found**: Install WSL 2:
  ```powershell
  wsl --install
  ```
- **Virtualization disabled**: Enable virtualization in BIOS settings
- **Docker Desktop won't start**: Check Windows features and ensure WSL 2 is enabled

## Additional Resources

- [Docker Official Documentation](https://docs.docker.com/)
- [Docker Hub](https://hub.docker.com/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)
- [Docker Desktop Documentation](https://docs.docker.com/desktop/)

## Author

**Ali Mansouri**

For consultation and service setup inquiries, please feel free to contact:

- 📧 Email: [ali.mansouri1998@gmail.com](mailto:ali.mansouri1998@gmail.com)
- 📧 Email: [a.mansouri@khu.ac.ir](mailto:a.mansouri@khu.ac.ir)
- 💼 LinkedIn: [Ali Mansouri](https://www.linkedin.com/in/ali-mansouri-a7984215b/)

## License

This guide is provided as-is for educational purposes.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

