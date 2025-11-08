# Python Version Manager (pyvm)

A cross-platform CLI tool to check and update your Python installation to the latest stable version.

## Features

- ✅ Check your current Python version against the latest stable release
- 🔄 Automatically download and install Python updates
- 🖥️ Cross-platform support (Windows, Linux, macOS)
- 📊 Detailed system information display
- 🚀 Simple and intuitive CLI interface

## Installation

**All dependencies are automatically installed!** 🎉

### Method 1: Install via pip (Recommended)

```bash
pip install pyvm-updater
```

### Method 2: Install from source

```bash
cd /path/to/sideProjects

# Optional: Check system requirements first
python3 check_requirements.py

# Install (dependencies installed automatically)
pip install -e .
```

This will automatically install all required dependencies:
- requests
- beautifulsoup4
- packaging
- click

The `pyvm` command will be available globally after installation.

**For detailed installation instructions, see [INSTALL.md](INSTALL.md)**

## Usage

### Check Python version

Simply run the tool to check your Python version:

```bash
pyvm
# or
pyvm check
```

Output example:
```
Checking Python version... (Current: 3.12.3)

========================================
     Python Version Check Report
========================================
Your version:   3.12.3
Latest version: 3.14.0
========================================
⚠ A new version (3.14.0) is available!

💡 Tip: Run 'pyvm update' to upgrade Python
```

### Update Python

Update to the latest version:

```bash
pyvm update
```

For automatic update without confirmation:

```bash
pyvm update --auto
```

### Show system information

```bash
pyvm info
```

Output example:
```
==================================================
           System Information
==================================================
Operating System: Linux
Architecture:     amd64
Python Version:   3.12.3
Python Path:      /usr/bin/python3
Platform:         Linux-5.15.0-generic-x86_64

Admin/Sudo:       No
==================================================
```

### Show tool version

```bash
pyvm --version
```

## Platform-Specific Notes

### Windows
- Downloads the official Python installer (.exe)
- Runs the installer interactively
- **Recommendation**: Check "Add Python to PATH" during installation

### Linux
- Uses system package managers (apt, yum, dnf)
- May require `sudo` privileges
- For Ubuntu/Debian: Uses deadsnakes PPA for latest versions
- **Alternative**: Install pyenv for easier version management

### macOS
- Uses Homebrew if available
- Falls back to official installer download link
- Run `brew install python@3.x` for Homebrew installation

## Requirements

- Python 3.7 or higher
- Internet connection
- Admin/sudo privileges (for updates on some systems)

## Dependencies

- `requests` - HTTP library
- `beautifulsoup4` - HTML parsing
- `packaging` - Version comparison
- `click` - CLI framework

## Commands Reference

| Command | Description |
|---------|-------------|
| `pyvm` | Check Python version (default) |
| `pyvm check` | Check Python version |
| `pyvm update` | Update Python to latest version |
| `pyvm update --auto` | Update without confirmation |
| `pyvm info` | Show system information |
| `pyvm --version` | Show tool version |
| `pyvm --help` | Show help message |

## Exit Codes

- `0` - Success or up-to-date
- `1` - Update available or error occurred
- `130` - Operation cancelled by user (Ctrl+C)

## Troubleshooting

### Import errors
If you get import errors, install dependencies:
```bash
pip install requests beautifulsoup4 packaging click
```

### Permission errors (Linux/macOS)
Some operations require elevated privileges:
```bash
sudo pyvm update
```

### Windows installer issues
- Make sure you have administrator privileges
- Temporarily disable antivirus if installer is blocked
- Download manually from https://www.python.org/downloads/

## Development

To set up for development:

```bash
# Clone or navigate to the project
cd /home/shreyasmene06/coding/sideProjects

# Install in editable mode
pip install -e .

# Run tests (if available)
python -m pytest
```

## License

MIT License - Feel free to use and modify

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Author

Created with ❤️ for the Python community

## Disclaimer

This tool downloads and installs software from python.org. Always verify the authenticity of downloaded files. The authors are not responsible for any issues arising from Python installations.
