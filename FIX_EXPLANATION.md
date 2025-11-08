# Fix for Setting Python as Global Default

## Problem Description

When using `pyvm update` on a Linux system without Anaconda, the script would install the latest Python version (e.g., Python 3.12) but it would only be accessible via `python3.12` command. The global `python3` command would still point to the old version, which contradicted the promise of setting the latest version as the global default.

### Issue Details

1. User installs Python via `pyvm update`
2. New Python is installed at `/usr/bin/python3.12`
3. Command `which python3` shows `/usr/bin/python3`
4. But `python3 --version` shows old version (e.g., 3.10)
5. User must manually use `python3.12` instead of `python3`

This was especially problematic for users without Anaconda, who expected `python3` to be updated to the latest version.

## Root Causes

### 1. Installation Only
The `update_python_linux()` function only installed Python using apt:
```bash
sudo apt install python3.12
```

This installs the Python binary but doesn't configure it as the system default.

### 2. Manual Instructions Only
The `_set_python_default_linux()` function only **displayed instructions** for the user to run manually. It didn't actually execute the commands to set Python as default.

### 3. Hardcoded Version
The function had a hardcoded reference to Python 3.12:
```python
"sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.12 1"
```

This would fail for any other version.

### 4. No Automation Option
Users had no way to automatically set the new Python as default during installation.

## Solution

### 1. Added `--set-default` Flag
```bash
pyvm update --set-default
```

This flag tells the tool to automatically configure the new Python as system default after installation.

### 2. New `set-default` Command
```bash
# List available versions
pyvm set-default

# Set specific version as default
pyvm set-default 3.12
```

This standalone command allows users to switch Python versions at any time.

### 3. Automatic Configuration
The improved `_set_python_default_linux()` function now:

- Detects the current Python 3 default
- Registers both old and new versions with `update-alternatives`
- Sets the new version with higher priority
- Uses `update-alternatives --set` for immediate effect
- Verifies the change with `python3 --version`

### 4. Intelligent Version Detection
```python
# Finds all Python versions in /usr/bin and /usr/local/bin
# Lists them for user to choose from
pyvm set-default  # Shows: Python 3.12, 3.11, 3.10, etc.
```

### 5. Complete Package Installation
Now installs additional packages needed for full functionality:
```bash
sudo apt install python3.12-venv python3.12-distutils
```

## Technical Implementation

### Update Alternatives Configuration

The fix uses Linux's `update-alternatives` system:

```bash
# Register old version (priority 1)
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1

# Register new version (priority 2 - higher)
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.12 2

# Set new version as default immediately
sudo update-alternatives --set python3 /usr/bin/python3.12
```

This creates a symbolic link: `/usr/bin/python3` → `/usr/bin/python3.12`

### Verification

After configuration, the script verifies:
```bash
python3 --version
# Output: Python 3.12.x
```

## Usage Examples

### Automatic Setup During Update
```bash
# One command to install and set as default
pyvm update --auto --set-default
```

### Manual Setup After Update
```bash
# First, install Python
pyvm update

# Later, set as default
pyvm set-default 3.12
```

### Switch Between Versions
```bash
# Switch to Python 3.11
pyvm set-default 3.11

# Switch back to Python 3.12
pyvm set-default 3.12
```

## Benefits

1. **Meets User Expectations**: Python is actually set as global default as promised
2. **No Manual Configuration**: Users don't need to run complex commands manually
3. **Flexibility**: Users can choose to set as default now or later
4. **Version Management**: Easy switching between installed Python versions
5. **Complete Installation**: Includes all necessary packages (venv, distutils)
6. **Verification**: Automatically confirms the change worked

## Backwards Compatibility

The changes are fully backwards compatible:

- Old command `pyvm update` still works (shows instructions as before)
- New flags are optional
- Non-Linux systems unaffected
- Existing scripts and workflows continue to work

## Testing

Test the fix by:

1. Run on a Linux system without the target Python version
2. Execute `pyvm update --set-default`
3. Verify `python3 --version` shows new version
4. Create virtual environment: `python3 -m venv test`
5. Test version switching with `pyvm set-default`

## Future Improvements

Potential enhancements:

- Support for other package managers (yum, dnf)
- Automatic detection of whether user wants default change
- Backup/restore functionality for Python configurations
- Integration with pyenv for even more flexibility

## References

- [update-alternatives manual](https://manpages.ubuntu.com/manpages/focal/man1/update-alternatives.1.html)
- [PEP 394 - The "python" Command on Unix-Like Systems](https://peps.python.org/pep-0394/)
- [Deadsnakes PPA](https://launchpad.net/~deadsnakes/+archive/ubuntu/ppa)
