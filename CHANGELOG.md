# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.2] - 2024-11-08

### Fixed
- Fixed type checking issue with `ctypes.windll` on Windows platform (added type ignore comment)
- Fixed BeautifulSoup attribute type handling for download URL extraction
- Improved type safety by properly casting BeautifulSoup `.get()` return values to strings
- Enhanced error handling for download URL processing

### Changed
- Updated author information in setup.py
- Added .gitignore file for better repository management

## [1.0.1] - Previous Release

### Added
- Cross-platform Python version checking
- Automatic Python updates for Windows, Linux, and macOS
- CLI interface with click
- System information display
- Comprehensive documentation

## [1.0.0] - Initial Release

### Added
- Initial release of Python Version Manager
- Support for Windows, Linux, and macOS
- Version checking against python.org
- Automated installation features
