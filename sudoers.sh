#!/usr/bin/env zsh

SCRIPT="${(%):-%x}"
DIR="$( cd "$( dirname "${SCRIPT}" )" >/dev/null 2>&1 && pwd )"

# Assumes ansible was installed with pip3 --user (see init.sh).
"$(python3 -m site --user-base)"/bin/ansible-playbook "${DIR}"/sudoers-playbook.yml "$@"


# Local Variables:
# mode: sh
# sh-shell: zsh
# End:
