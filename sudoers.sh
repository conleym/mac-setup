#!/usr/bin/env zsh

# Runs sudoers-playbook to add a user to sudoers.
# Arguments passed to the script are passed to ansible.

SCRIPT="${(%):-%x}"
DIR="$( cd "$( dirname "${SCRIPT}" )" >/dev/null 2>&1 && pwd )"

source "${DIR}/common.sh"
PLAYBOOK="$(_ansible_playbook_ "${DIR}")"

# Run the sudoers playbook with any provided arguments.
"${PLAYBOOK}" "${DIR}"/sudoers-playbook.yml "$@"


# Local Variables:
# mode: sh
# sh-shell: zsh
# End:
