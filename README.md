# Ansible macOS setup

Tested on Catalina. Requires python3.

## Prerequisites

1. xcode command line tools (`xcode-select --install`), includes `python3` with `pip3`.
1. ansible (`pip3 install [--user] ansible`)
1. mas (https://github.com/mas-cli/mas/releases), because the MacPorts version is old and broken.


## How do?

1. Run `ansible-playbook -K playbook.yml` (omit `-K` if you're set up with passwordless `sudo` or whatever).


## What it does

1. Install MacPorts and a configurable list of ports/variants.
1. Install JetBrains toolbox (you'll have to manually install the apps you want -- there doesn't seem to be a way to automate this).
1. Install apps from a configurable list of App Store apps (using `mas`).
