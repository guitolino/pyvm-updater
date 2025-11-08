#!/bin/bash
# Installation script for pyvm (Python Version Manager)
# Works on Linux and macOS

echo "=================================================="
echo "  Installing Python Version Manager (pyvm)"
echo "=================================================="
echo ""

# Check if pip is available
if ! command -v pip3 &> /dev/null && ! command -v pip &> /dev/null; then
    echo "❌ Error: pip is not installed."
    echo "Please install pip first:"
    echo "  - Ubuntu/Debian: sudo apt install python3-pip"
    echo "  - Fedora: sudo dnf install python3-pip"
    echo "  - macOS: python3 -m ensurepip"
    exit 1
fi

# Determine pip command
if command -v pip3 &> /dev/null; then
    PIP_CMD="pip3"
else
    PIP_CMD="pip"
fi

echo "📦 Installing required packages..."
echo ""

# Install the package
$PIP_CMD install requests beautifulsoup4 packaging click

if [ $? -ne 0 ]; then
    echo ""
    echo "❌ Failed to install dependencies."
    exit 1
fi

echo ""
echo "📥 Installing pyvm from current directory..."
echo ""

# Install in editable mode
$PIP_CMD install -e .

if [ $? -eq 0 ]; then
    echo ""
    echo "=================================================="
    echo "  ✅ Installation successful!"
    echo "=================================================="
    echo ""
    echo "You can now use the 'pyvm' command:"
    echo "  pyvm          - Check Python version"
    echo "  pyvm check    - Check Python version"
    echo "  pyvm update   - Update Python"
    echo "  pyvm info     - Show system info"
    echo "  pyvm --help   - Show help"
    echo ""
    echo "Note: You may need to add ~/.local/bin to your PATH"
    echo "      if 'pyvm' command is not found."
    echo ""
else
    echo ""
    echo "❌ Installation failed."
    echo "Please check the error messages above."
    exit 1
fi
