#!/usr/bin/env zsh

SCRIPT="${(%):-%x}"
DIR="$( cd "$( dirname "${SCRIPT}" )" >/dev/null 2>&1 && pwd )"


# Make sure we pick up macports once it's installed.
# When we install macports, we add to /etc/paths. But the shell running now
# might not have that set up yet, causing failures later. Ensure path is
# defined here.
export PATH=/opt/local/bin:/opt/local/sbin:"${PATH}"

# Assumes ansible was installed with pip3 --user (see init.sh).
"$(python3 -m site --user-base)"/bin/ansible-playbook "${DIR}"/setup-playbook.yml "$@"


# Local Variables:
# mode: sh
# sh-shell: zsh
# End:
