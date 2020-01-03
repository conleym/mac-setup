# Ansible macOS setup

Tested on Catalina. Requires python3.

## Prerequisites

1. xcode command line tools (`xcode-select --install`), includes `python3` with `pip3`.
1. ansible (`pip3 install [--user] ansible`)
1. mas (https://github.com/mas-cli/mas/releases), because the MacPorts version is old and broken.


## How do?

1. Run `ansible-playbook -K playbook.yml` (omit `-K` if you're set up with passwordless `sudo` or whatever).
1. The following `tags` are defined:
    - ports
    - tex
    - emacs

## What it does

1. Install [MacPorts](https://www.macports.org/) and a configurable list of ports/variants.
1. Install [MacTeX](https://www.tug.org/mactex/).
1. Install [XQuartz](https://www.xquartz.org/).
1. Install [GPG tools](https://gpgtools.org/).
1. Download and copy apps from a configurable list of disk image URLs. 
1. Install apps from a configurable list of App Store apps (using `mas`).
1. Install a configurable list of python3 packages using `pip3`.


## TODO

### GPG tools

GPG tools on requires additional setup -- open Mail > Preferences > General, click on Manage Plug-ins...
and check the box next to the GPGMailLoader plugin.

### More disk images

Docker, Vagrant, etc.


### Other stuff

Iterm2, with integration, dotfiles, various settings via the `defaults` command, etc.