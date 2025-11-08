# Installation Guide - Python Version Manager

## 🚀 Quick Install (Recommended)

### Step 1: Pre-Installation Check (Optional but Recommended)
```bash
cd /home/shreyasmene06/coding/sideProjects
python3 check_requirements.py
```

This will verify:
- ✓ Python version (3.7+ required)
- ✓ pip is installed
- ✓ Internet connectivity
- ✓ Operating system support
- ✓ Installation permissions
- ✓ Existing dependencies

### Step 2: Install the Tool

**Option A: Development Install (Editable)**
```bash
pip install -e .
```

**Option B: User Install (No sudo required)**
```bash
pip install --user -e .
```

**Option C: System-wide Install**
```bash
sudo pip install -e .
```

### Step 3: Verify Installation
```bash
pyvm --version
pyvm check
```

---

## 📦 Dependencies

All dependencies are automatically installed via `setup.py`:

- `requests>=2.25.0` - HTTP requests for downloading Python info
- `beautifulsoup4>=4.9.0` - HTML parsing for Python.org
- `packaging>=20.0` - Version comparison
- `click>=8.0.0` - CLI framework

---

## 🔧 Manual Dependency Installation (If Needed)

If automatic installation fails:

```bash
pip install requests beautifulsoup4 packaging click
```

Or use the included install scripts:

**Linux/macOS:**
```bash
bash install.sh
```

**Windows:**
```cmd
install.bat
```

---

## 🖥️ Platform-Specific Notes

### Windows
- No additional requirements
- Installer will be downloaded and launched
- **Tip**: Run as Administrator for system-wide installation

### Linux (Ubuntu/Debian)
- Uses `apt` package manager
- Adds `deadsnakes/ppa` for latest Python versions
- **Requires**: `sudo` privileges for installation
- **Alternative**: Use `pyenv` for user-level installations

### Linux (Fedora/RHEL/CentOS)
- Uses `dnf` or `yum` package manager
- May not have latest Python versions
- **Recommended**: Use `pyenv` for version-specific installs

### macOS
- **With Homebrew** (Recommended):
  - Automatic updates via `brew upgrade python3`
- **Without Homebrew**:
  - Downloads official installer from Python.org
  - Manual installation required

---

## 🧪 Testing Your Installation

```bash
# Check current Python version
pyvm check

# Show system information
pyvm info

# Check for updates (safe, won't install)
pyvm update

# Update Python (with confirmation prompt)
pyvm update

# Update Python (automatic, no prompt)
pyvm update --auto
```

---

## 🔍 Troubleshooting

### "Command not found: pyvm"

**Fix 1**: Ensure pip install location is in PATH
```bash
# Check where pyvm is installed
pip show -f pyvm-updater

# Add to PATH (Linux/macOS - add to ~/.bashrc or ~/.zshrc)
export PATH="$HOME/.local/bin:$PATH"

# Add to PATH (Windows)
# Control Panel → System → Advanced → Environment Variables
# Add: C:\Users\YourName\AppData\Local\Programs\Python\Python3X\Scripts
```

**Fix 2**: Use Python module syntax
```bash
python -m python_version check
```

### "ImportError: No module named 'click'"

Dependencies weren't installed. Run:
```bash
pip install -e .
```

Or manually:
```bash
pip install requests beautifulsoup4 packaging click
```

### "Permission denied" errors on Linux

Use user install instead:
```bash
pip install --user -e .
```

### Network/SSL errors

Update pip and certificates:
```bash
pip install --upgrade pip certifi
```

### Version mismatch after update

The tool updates Python system-wide, but your current terminal may still use the old version.

**Solution**: Restart your terminal/IDE or run:
```bash
hash -r  # Bash/Zsh
rehash   # Tcsh
```

---

## 🔄 Updating the Tool Itself

```bash
cd /home/shreyasmene06/coding/sideProjects
git pull  # If using git
pip install --upgrade -e .
```

---

## 🗑️ Uninstallation

```bash
pip uninstall pyvm-updater
```

---

## 📚 Usage Examples

### Check version only
```bash
pyvm check
# Exit code 0 = up-to-date
# Exit code 1 = update available
```

### Automated update in scripts
```bash
#!/bin/bash
if ! pyvm check; then
    echo "Update available!"
    pyvm update --auto
fi
```

### Show detailed system info
```bash
pyvm info
```

---

## 🛡️ Security Notes

1. **Always verify**: This tool downloads from python.org (official source)
2. **Admin required**: Updates require sudo/admin on most systems
3. **Manual verification**: Review installer prompts before proceeding
4. **PPA trust**: Linux users should trust the deadsnakes PPA

---

## 🆘 Getting Help

1. Check `SECURITY_FIXES.md` for known issues and fixes
2. Run pre-installation checker: `python3 check_requirements.py`
3. Enable verbose mode (if available): `pyvm --verbose check`
4. Check logs in terminal output

---

## ✅ Post-Installation Checklist

- [ ] `pyvm --version` works
- [ ] `pyvm check` shows current version
- [ ] Internet connectivity confirmed
- [ ] Admin/sudo available (if needed)
- [ ] PATH configured correctly
- [ ] All dependencies installed

---

## 🎯 Next Steps

After successful installation:

1. **Check your version**: `pyvm check`
2. **Update if needed**: `pyvm update`
3. **Restart terminal/IDE** to use new Python version
4. **Verify update**: `python --version`

**Enjoy your updated Python! 🐍**
