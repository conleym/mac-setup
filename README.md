# Ansible macOS setup

Tested on Catalina. Requires python3.

## Prerequisites

1. xcode command line tools (`xcode-select --install`), includes `python3` with `pip3`.
1. ansible (`pip3 install [--user] ansible`)

## How do?

1. Run `ansible-playbook -K playbook.yml` (omit `-K` if you're set up with passwordless `sudo` or whatever).
1. The following `tags` are defined:
    - ports:    Install [MacPorts](https://www.macports.org/) and a configurable list of ports/variants (see `ports.yml`).
    - tex:      Install [MacTeX](https://www.tug.org/mactex/).
    - r:        Install [R](https://cran.r-project.org/).
    - emacs:    Clone emacs from github, build, and install. Clones my emacs config.
    - pip:      Install pip packages (see `pip.yml`).
    - dotfiles: Clone my [dotfiles](https://github.com/conleym/dotfiles) and [emacs config](https://github.com/conleym/dot-emacs).
    - apps:     Install applications from the app store using `mas` and from non-app-store disk images (see `mas.yml` and `dmgs.yml`).
     Note that some apps require `mas`, installed via MacPorts (use the `ports` tag).

### Other software installed

1. [Postman](https://www.postman.com/)

## TODO

### GPG tools

GPG tools on requires additional setup -- open Mail > Preferences > General, click on Manage Plug-ins...
and check the box next to the GPGMailLoader plugin.

### More disk images

Vagrant, etc.


### Other stuff

Iterm2, with integration, various settings via the `defaults` command, etc.

Select ports role with list of ports to select, etc.

Log in to docker hub and other accounts.
