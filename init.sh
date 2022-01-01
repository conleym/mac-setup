#!/usr/bin/env zsh

SCRIPT="${(%):-%x}"
DIR="$( cd "$( dirname "${SCRIPT}" )" >/dev/null 2>&1 && pwd )"

# Accept the Xcode license
sudo xcodebuild -license accept

# Install the latest version of ansible
pip3 install --user --upgrade ansible

# Install additional python requirements needed by tasks used in these playbooks.
pip3 install --user --upgrade -r r"${DIR}"/requirements.txt

# Install playbook requirements.
"$(python3 -m site --user-base)"/bin/ansible-galaxy install -r "${DIR}"/requirements.yml
