#!/usr/bin/env zsh

SCRIPT="${(%):-%x}"
DIR="$( cd "$( dirname "${SCRIPT}" )" >/dev/null 2>&1 && pwd )"

zparseopts -D -E -F -- \
  u=UPGRADE -upgrade-venv=UPGRADE

# Accept the Xcode license, install python and ansible-galaxy dependencies, including ansible itself.
# Can be run again to upgrade any of the python or ansible-galaxy dependencies.

# Accept the Xcode license. Can't run pip without doing this first.
sudo xcodebuild -license accept

if ! xcodebuild -checkFirstLaunchStatus; then
  echo "Running Xcode first launch tasks."
  sudo xcodebuild -runFirstLaunch
  echo "Done."
fi

source "${DIR}/common.sh"

VENV="$(_ansible_venv_ "${DIR}")"
PIP="$(_ansible_pip_ "${DIR}")"
GALAXY="$(_ansible_galaxy_ "${DIR}")"

ANSIBLE_HOME="$(_ansible_home "${DIR}")"
export ANSIBLE_HOME

if [[ ! -e "${PIP}" ]]; then
  # Create the virtual environment. This will use whatever version of python is on the path, and will copy
  # that python and its libraries into the virtualenv rather than linking them.
  python3 -m venv --copies --without-scm-ignore-files "${VENV}"
elif (( $#UPGRADE > 0 )); then
    echo "Upgrading virtual environment..."
    # TODO Annoyingly, this prints an error if the python version is the same in the path and virtualenv...
    python3 -m venv --copies --upgrade --without-scm-ignore-files "${VENV}"
    echo "Done."
else
  echo "Skipping virtual environment creation/upgrade."
fi

# Install the latest version of pip. Some older versions won't download cryptography wheels for some reason, causing
# the ansible install to fail.
"${PIP}" install --upgrade pip --no-warn-script-location

# Install ansible and python requirements needed by tasks used in these playbooks.
"${PIP}" install --upgrade -r "${DIR}"/requirements.txt --no-warn-script-location

# Install playbook requirements from ansible galaxy.
"${GALAXY}" install -r "${DIR}"/requirements.yml


# Local Variables:
# mode: sh
# sh-shell: zsh
# End:
