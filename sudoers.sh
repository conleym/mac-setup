#!/usr/bin/env zsh

# Runs sudoers-playbook to add a user to sudoers.
# Arguments passed to the script are passed to ansible.

SCRIPT="${(%):-%x}"
DIR="$( cd "$( dirname "${SCRIPT}" )" >/dev/null 2>&1 && pwd )"

source "${DIR}/common.sh"
ANSIBLE_PLAYBOOK="$(_ansible_playbook_ "${DIR}")"
ANSIBLE_HOME="$(_ansible_home "${DIR}")"
export ANSIBLE_HOME

# Run the sudoers playbook with any provided arguments.
"${ANSIBLE_PLAYBOOK}" "${DIR}"/sudoers-playbook.yml "$@"


# Local Variables:
# mode: sh
# sh-shell: zsh
# End:
