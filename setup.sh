#!/usr/bin/env zsh

SCRIPT="${(%):-%x}"
DIR="$( cd "$( dirname "${SCRIPT}" )" >/dev/null 2>&1 && pwd )"


# Make sure we pick up macports once it's installed.
# When we install macports, we add to /etc/paths. But the shell running now
# might not have that set up yet, causing failures later. Ensure path is
# defined here.
export PATH=/opt/local/bin:/opt/local/sbin:"${PATH}"

source "${DIR}/common.sh"
PLAYBOOK="$(_ansible_playbook_ "${DIR}")"

# Run the setup playbook with any provided arguments.
"${PLAYBOOK}" "${DIR}"/setup-playbook.yml "$@"


# Local Variables:
# mode: sh
# sh-shell: zsh
# End:
