#!/usr/bin/env zsh

SCRIPT="${(%):-%x}"
DIR="$( cd "$( dirname "${SCRIPT}" )" >/dev/null 2>&1 && pwd )"

# Run bootstrap. Installs Xcode's "additional components", if necessary. Installs MacPorts and ports required by setup.
"$(python3 -m site --user-base)"/bin/ansible-playbook "${DIR}"/bootstrap-playbook.yml "$@"


# Local Variables:
# mode: sh
# sh-shell: zsh
# End:
