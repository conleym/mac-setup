# Ansible macOS setup

Tested on Catalina. Requires python3.

## Prerequisites

1. Install XCode. (The command line tools are insufficient. 
python3 seems to be unable to verify ssl certificates without the full app).
1. Run `init.sh`, which does the following:
    1. Accepts the Xcode license (may prompt for admin password)
    1. ansible (`pip3 install --user ansible`)

## How do?

### For the impatient

1. Grant yourself passwordless sudo permission: `sudoers.sh -K -e nopasswd=yes`
1. Run the playbook `setup.sh`.

### For the more patient

1. Optionally grant users the ability to use sudo with `sudoers.sh -K`. See the playbook for
options.
1. Run `setup.sh -K` (omit `-K` if you're set up with passwordless `sudo` or whatever). The script passes all 
arguments on to `ansible-playbook`.
1. The following `tags` are defined:
    - ports:     Install [MacPorts](https://www.macports.org/) and a configurable list of ports/variants (see `vars/ports.yml`).
    - tex:       Install [MacTeX](https://www.tug.org/mactex/).
    - emacs:     Clone emacs from github, build, and install. Clones my emacs config.
    - pip:       Install pip packages (see `vars/pip.yml`).
    - dotfiles:  Clone my [dotfiles](https://github.com/conleym/dotfiles) and
     [emacs config](https://github.com/conleym/dot-emacs).
    - apps:      Install applications from the app store using `mas` and from non-app-store disk images 
                 (see `vars/mas.yml` and `vars/dmgs.yml`).
    - customize: Customize app and OS settings. 
    - fonts:     Install fonts (see `vars/fonts.yml`).
 
Note that some apps require `mas`, installed via MacPorts (use the `ports` tag),
and that `emacs` requires both `ports` (for dependencies)
and `pip` (to install [macholib](https://github.com/ronaldoussoren/macholib/), used to make the app standalone).

Some fonts require `gnutar`, also installed via the `ports` tag.

### Other software installed

1. [Postman](https://www.postman.com/)
1. [iTerm2](https://https://www.iterm2.com/downloads.html)

### Fonts installed

1. [JetBrains Mono](https://www.jetbrains.com/lp/mono/)
1. [DejaVu](https://dejavu-fonts.github.io/)


## TODO

### GPG tools

GPG tools on requires additional setup -- open Mail > Preferences > General, click on Manage Plug-ins...
and check the box next to the GPGMailLoader plugin.

### Other stuff

* Fonts.
    * [Noto](https://www.google.com/get/noto/)
    * [ProFont](https://tobiasjung.name/profont/)
    * [STIX](https://www.stixfonts.org/)
    * [Source Code Pro](https://github.com/adobe-fonts/source-code-pro), etc.
    * fontconfig settings for DejaVu.
* iTerm2 integration and settings.
* More settings via `osx_defaults`.
* Secrets via lastpass.
    * SSH public/private keys.
    * GPG public/private keys.
    * Log in to docker hub and other accounts.
