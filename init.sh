#!/usr/bin/env zsh

SCRIPT="${(%):-%x}"
DIR="$( cd "$( dirname "${SCRIPT}" )" >/dev/null 2>&1 && pwd )"

# Accept the Xcode license. Can't run pip without doing this first.
sudo xcodebuild -license accept

# Install the latest version of pip. Some older versions won't download cryptography wheels for some reason, causing
# the ansible install to fail.
pip3 install --user --upgrade pip

# Install ansible and python requirements needed by tasks used in these playbooks.
pip3 install --user --upgrade -r "${DIR}"/requirements.txt

# Install playbook requirements from ansible galaxy.
"$(python3 -m site --user-base)"/bin/ansible-galaxy install -r "${DIR}"/requirements.yml
