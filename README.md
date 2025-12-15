# Homebrew Tap for atmosenv

This is the official Homebrew tap for [atmosenv](https://github.com/jamengual/atmosenv), an Atmos version manager inspired by tfenv.

## Installation

```bash
brew tap jamengual/atmosenv
brew install atmosenv
```

## Usage

After installation, add atmosenv to your shell:

**Bash** (`~/.bashrc` or `~/.bash_profile`):
```bash
export PATH="$(brew --prefix)/opt/atmosenv/bin:$PATH"
eval "$(atmosenv init -)"
```

**Zsh** (`~/.zshrc`):
```bash
export PATH="$(brew --prefix)/opt/atmosenv/bin:$PATH"
eval "$(atmosenv init -)"
```

**Fish** (`~/.config/fish/config.fish`):
```fish
fish_add_path (brew --prefix)/opt/atmosenv/bin
atmosenv init - | source
```

Then restart your shell or source the config file.

## Quick Start

```bash
# Install the latest Atmos version
atmosenv install latest

# Switch to the installed version
atmosenv use latest

# Verify installation
atmos version

# List available versions
atmosenv list-remote
```

## Updating

```bash
brew update
brew upgrade atmosenv
```

## Uninstalling

```bash
brew uninstall atmosenv
brew untap jamengual/atmosenv
```

## More Information

- [atmosenv GitHub Repository](https://github.com/jamengual/atmosenv)
- [Atmos Documentation](https://atmos.tools/)

## License

Apache License 2.0
