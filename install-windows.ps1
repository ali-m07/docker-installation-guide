# Docker Installation Script for Windows
# This script helps install Docker Desktop on Windows

Write-Host "🐳 Docker Installation Script for Windows" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if running as Administrator
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (-not $isAdmin) {
    Write-Host "⚠️  Some steps require Administrator privileges." -ForegroundColor Yellow
    Write-Host "   Please run PowerShell as Administrator for full automation." -ForegroundColor Yellow
    Write-Host ""
}

# Check WSL 2
Write-Host "🔍 Checking WSL 2 installation..." -ForegroundColor Cyan
$wslInstalled = Get-Command wsl -ErrorAction SilentlyContinue

if ($wslInstalled) {
    $wslVersion = wsl --status 2>&1
    Write-Host "✅ WSL is installed" -ForegroundColor Green
} else {
    Write-Host "❌ WSL is not installed" -ForegroundColor Red
    Write-Host ""
    Write-Host "Installing WSL 2..." -ForegroundColor Yellow
    
    if ($isAdmin) {
        wsl --install
        Write-Host "✅ WSL 2 installation initiated" -ForegroundColor Green
        Write-Host "⚠️  Please restart your computer after WSL installation completes" -ForegroundColor Yellow
    } else {
        Write-Host "⚠️  Please run PowerShell as Administrator and run:" -ForegroundColor Yellow
        Write-Host "   wsl --install" -ForegroundColor White
        Write-Host "   Then restart your computer" -ForegroundColor White
    }
    Write-Host ""
}

# Check if Docker Desktop is already installed
Write-Host "🔍 Checking for existing Docker installation..." -ForegroundColor Cyan
$dockerInstalled = Get-Command docker -ErrorAction SilentlyContinue

if ($dockerInstalled) {
    Write-Host "✅ Docker is already installed" -ForegroundColor Green
    Write-Host "   Version: $(docker --version)" -ForegroundColor White
    Write-Host ""
    Write-Host "🧪 Testing Docker..." -ForegroundColor Cyan
    docker run hello-world
    exit 0
}

Write-Host "📥 Docker Desktop is not installed" -ForegroundColor Yellow
Write-Host ""

# Download Docker Desktop
Write-Host "📥 Downloading Docker Desktop installer..." -ForegroundColor Cyan
$dockerUrl = "https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe"
$installerPath = "$env:TEMP\DockerDesktopInstaller.exe"

try {
    Write-Host "   Downloading from: $dockerUrl" -ForegroundColor Gray
    Invoke-WebRequest -Uri $dockerUrl -OutFile $installerPath -UseBasicParsing
    Write-Host "✅ Download complete" -ForegroundColor Green
} catch {
    Write-Host "❌ Failed to download Docker Desktop" -ForegroundColor Red
    Write-Host "   Error: $_" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please download manually from:" -ForegroundColor Yellow
    Write-Host "   https://www.docker.com/products/docker-desktop" -ForegroundColor White
    exit 1
}

Write-Host ""
Write-Host "🚀 Starting Docker Desktop installer..." -ForegroundColor Cyan
Write-Host "   Please follow the installation wizard" -ForegroundColor Yellow
Write-Host "   Make sure to enable WSL 2 integration if prompted" -ForegroundColor Yellow
Write-Host ""

# Run installer
Start-Process -FilePath $installerPath -Wait

Write-Host ""
Write-Host "✅ Installation complete!" -ForegroundColor Green
Write-Host ""
Write-Host "⚠️  IMPORTANT: Please restart your computer if prompted" -ForegroundColor Yellow
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "  1. Restart your computer (if needed)" -ForegroundColor White
Write-Host "  2. Launch Docker Desktop from Start menu" -ForegroundColor White
Write-Host "  3. Accept the terms of service" -ForegroundColor White
Write-Host "  4. Complete the setup wizard" -ForegroundColor White
Write-Host "  5. Verify: docker run hello-world" -ForegroundColor White

