# Ansible macOS setup

Tested on Catalina. Requires python3.

## Prerequisites

1. Run `init/init.sh`, which installs the following:
    1. xcode command line tools (`xcode-select --install`), includes `python3` with `pip3`.
    1. ansible (`pip3 install [--user] ansible`)
1. Install XCode (long story, but python3 seems to be unable to verify ssl certificates without it.).

## How do?

1. Run `ansible-playbook -K playbook.yml` (omit `-K` if you're set up with passwordless `sudo` or whatever).
1. The following `tags` are defined:
    - ports:     Install [MacPorts](https://www.macports.org/) and a configurable list of ports/variants (see `ports.yml`).
    - tex:       Install [MacTeX](https://www.tug.org/mactex/).
    - emacs:     Clone emacs from github, build, and install. Clones my emacs config.
    - pip:       Install pip packages (see `pip.yml`).
    - dotfiles:  Clone my [dotfiles](https://github.com/conleym/dotfiles) and
     [emacs config](https://github.com/conleym/dot-emacs).
    - apps:      Install applications from the app store using `mas` and from non-app-store disk images (see `mas.yml` and `dmgs.yml`).
    - customize: Customize app and OS settings. 
    - fonts:     Install fonts (see fonts.yml).
 
Note that some apps require `mas`, installed via MacPorts (use the `ports` tag),
and that `emacs` requires both `ports` (for dependencies)
and `pip` (to install [macholib](https://github.com/ronaldoussoren/macholib/), used to make the app standalone).

### Other software installed

1. [Postman](https://www.postman.com/)
1. [iTerm2](https://https://www.iterm2.com/downloads.html)

### Fonts installed

1. [JetBrains Mono](https://www.jetbrains.com/lp/mono/)


## TODO

### GPG tools

GPG tools on requires additional setup -- open Mail > Preferences > General, click on Manage Plug-ins...
and check the box next to the GPGMailLoader plugin.

### Other stuff

* Fonts.
    * [Noto](https://www.google.com/get/noto/)
    * [ProFont](https://tobiasjung.name/profont/)
    * [STIX](https://www.stixfonts.org/)
* iTerm2 integration and settings.
* More settings via `osx_defaults`.
* Secrets via lastpass.
    * SSH public/private keys.
    * GPG public/private keys.
    * Log in to docker hub and other accounts.
