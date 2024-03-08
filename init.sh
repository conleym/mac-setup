#!/usr/bin/env zsh

SCRIPT="${(%):-%x}"
DIR="$( cd "$( dirname "${SCRIPT}" )" >/dev/null 2>&1 && pwd )"

# Accept the Xcode license, install python and ansible-galaxy dependencies, including ansible itself.
# Can be run again to upgrade any of the python or ansible-galaxy dependencies.

# Accept the Xcode license. Can't run pip without doing this first.
sudo xcodebuild -license accept

if ! xcodebuild -checkFirstLaunchStatus; then
  echo "Running Xcode first launch tasks."
  sudo xcodebuild -runFirstLaunch
  echo "Done."
fi

# Install the latest version of pip. Some older versions won't download cryptography wheels for some reason, causing
# the ansible install to fail.
pip3 install --user --upgrade pip

# Install ansible and python requirements needed by tasks used in these playbooks.
pip3 install --user --upgrade -r "${DIR}"/requirements.txt --no-warn-script-location

# Install playbook requirements from ansible galaxy.
"$(python3 -m site --user-base)"/bin/ansible-galaxy install -r "${DIR}"/requirements.yml


# Local Variables:
# mode: sh
# sh-shell: zsh
# End:
