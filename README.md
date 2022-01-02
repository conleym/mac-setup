# Ansible macOS setup

Tested on Catalina. Requires python3. Only supports intel macs for now.


## Prerequisites

Install XCode. (The command line tools are insufficient. 
python3 seems to be unable to verify ssl certificates without the full app).

## How do?

### For the impatient

1. Run `init.sh`. You'll be prompted for your password.
2. Grant yourself passwordless sudo permission: `sudoers.sh -K -e nopasswd=yes`.
3. Run the bootstrap script: `bootstrap.sh`.
4. Run the playbook: `setup.sh`.

### For the more patient

1. Run `init.sh`, which does the following:
    1. Accepts the Xcode license (may prompt for admin password)
    2. Installs ansible (`pip3 install --user ansible`)
    3. Installs task dependencies in `requirements.txt` (again, with `pip3 install --user`).
    4. Installs dependencies in `requirements.yml` using `ansible-galaxy`.
2. Optionally grant users the ability to use sudo with `sudoers.sh -K`. See `sudoers-playbook.yml` for
   options.
3. Run `bootstrap.sh -K` (omit `-K` if you're set up with passwordless `sudo`). This runs `bootstrap-playbook.yml`,
   which runs Xcode's first launch tasks (if necessary) and installs [MacPorts](https://www.macports.org/), along with
   several ports needed to make setup tasks work properly. You only need to do this once. The playbook is imported in
   `setup-playbook.yml`, so the tasks will run again if necessary.
4. Sign in to the app store app.
   `mas` cannot install apps unless you do so, and sign in via the command line no longer works.
   See [mas known issues](https://github.com/mas-cli/mas#%EF%B8%8F-known-issues).
5. Sign in to lastpass: `lpass login USERNAME`.
6. Run `setup.sh -K` (omit `-K` if you're set up with passwordless `sudo`). The script passes all 
arguments on to `ansible-playbook`.
7. The following `tags` are defined (which you can pass to the script, e.g., `setup.sh --tags ports`):
    - ports:     Install/update a configurable list of ports/variants 
                    (see `vars/ports.yml`).
    - tex:       Install [MacTeX](https://www.tug.org/mactex/).
    - emacs:     Clone emacs from github, build, and install. 
                    Clones my [emacs config](https://github.com/conleym/dot-emacs).
                    Creates a launchd service for the emacs daemon.
    - pip:       Install pip packages (see `vars/pip.yml`).
    - dotfiles:  Clone my [dotfiles](https://github.com/conleym/dotfiles) and
                    [emacs config](https://github.com/conleym/dot-emacs).
    - apps:      Install applications from the app store using `mas` and from non-app-store disk images 
                     (see `vars/mas.yml` and `vars/dmgs.yml`).
                     You must be signed in to the app store for `mas` to function properly.
    - launchd:   Load launchd jobs (see `vars/launchd.yml`).             
    - customize: Customize app and OS settings.
                     You need to log out and log back in to apply many of the changes.
    - fonts:     Install fonts (see `vars/fonts.yml`).
 
### Other software installed

1. [Postman](https://www.postman.com/)
2. [iTerm2](https://www.iterm2.com/downloads.html)
3. [R](https://r-project.org/)
4. [terraform](https://www.terraform.io/)
5. [ngrok](https://ngrok.com/download)
6. [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
(includes the extension pack and accepts the license for same)
7. [Vagrant](https://www.vagrantup.com/downloads)

...and more.

### Fonts installed

1. [JetBrains Mono](https://www.jetbrains.com/lp/mono/)
2. [DejaVu](https://dejavu-fonts.github.io/)


## TODO

In general, more app preferences...

### Emacs

The daemon doesn't always start up properly. Investigate and fix.

### Jetbrains toolbox

1. Accept the agreement.
1. Install selected IDEs. The toolbox seems to be missing functionality to do this from the command line. Investigate
AppleScript, Automator, etc.

### VLC

Automatically enable metadata retrieval, so I don't have to click on the popup, or even see the popup.

### GPG tools

GPG tools on requires some manual setup. Open Mail > Preferences > General, click on "Manage Plug-ins...",
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
    * Log in to docker hub, jetbrains, and other accounts.
