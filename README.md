# dot-files

## Prerequisites

- [GNU Stow](https://www.gnu.org/software/stow/)
- Git
- Zsh

## Recommended
- `build-essential` `procps` `curl` `file` `git` - for Debian/Ubuntu.
- `gcc` `g++` `glibc-devel` `make` `procps-ng` `curl` `file` `git` on Fedora.
- xcode command line tools on MacOS. The installer script will install this if MacOS is detected.

## Example Usage

```
git clone git@github.com:danielproctor31/dot-files.git $HOME/dot-files
cd $HOME/dot-files

chmod u+x ./setup.sh ./install.sh
./setup.sh
./install.sh
```
