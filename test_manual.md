# Manual Testing Guide for v1.2.0

This guide helps you verify the new features work correctly.

## Test 1: Check `--set-default` flag

```bash
# Test help display (should show the new flag)
pyvm update --help

# Expected output should include:
# --set-default  Automatically set the new Python as system default (Linux only)
```

## Test 2: Test `set-default` command without arguments

```bash
# Should list available Python versions
pyvm set-default

# Expected output:
# 🔍 Available Python versions on your system:
# ------------------------------------------------------------
#   Python 3.12   at /usr/bin/python3.12 ← current default
#   Python 3.11   at /usr/bin/python3.11
# ------------------------------------------------------------
# 
# 💡 Usage: pyvm set-default <version>
#    Example: pyvm set-default 3.12
```

## Test 3: Test `set-default` command with version

```bash
# Try setting a specific version (adjust version to one you have)
pyvm set-default 3.11

# Expected:
# - Should run update-alternatives commands
# - Should show success messages
# - Should verify with python3 --version
```

## Test 4: Test `update --set-default`

```bash
# Dry run (if you're already on latest version, this won't do much)
pyvm update --set-default

# Expected behavior:
# - If update available: installs and automatically sets as default
# - If already up-to-date: shows "You already have the latest version"
```

## Test 5: Verify Installation Improvements

After running an update, check:

```bash
# Check if venv and distutils were installed
dpkg -l | grep python3.1[0-9]-venv
dpkg -l | grep python3.1[0-9]-distutils

# Try creating a virtual environment
python3 -m venv test_env
source test_env/bin/activate
python --version
deactivate
rm -rf test_env
```

## Test 6: Error Handling

```bash
# Try with non-existent version
pyvm set-default 3.99

# Expected:
# ❌ Python 3.99 not found!
#    Expected at: /usr/bin/python3.99
# 
# 💡 Run 'pyvm set-default' without arguments to see available versions.
```

## Test 7: Non-Linux System

On macOS or Windows:
```bash
pyvm set-default

# Expected:
# ❌ This command is only supported on Linux.
#    Your OS: darwin (or windows)
```

## Verification Checklist

- [ ] `pyvm update --help` shows `--set-default` flag
- [ ] `pyvm set-default` lists available Python versions
- [ ] `pyvm set-default X.Y` sets Python as default
- [ ] `update-alternatives` commands are executed correctly
- [ ] `python3 --version` reflects the new default after setting
- [ ] Error messages are clear and helpful
- [ ] Non-Linux systems show appropriate error message
- [ ] Installation includes venv and distutils packages
- [ ] `pyvm info` shows correct Python paths

## Rollback Test

```bash
# After changing default, try switching back
pyvm set-default <old-version>

# Should work seamlessly
```

## Notes

- Requires sudo privileges for setting default on Linux
- Test on a VM or system where you can safely modify Python defaults
- Keep a backup of your update-alternatives config if needed
