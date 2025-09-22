#!/usr/bin/env zsh

# shellcheck disable=SC2296
SCRIPT="${(%):-%x}"
DIR="$( cd "$( dirname "${SCRIPT}" )" >/dev/null 2>&1 && pwd )"

source "${DIR}/common.sh"
PLAYBOOK="$(_ansible_python_ "${DIR}")"

# Run bootstrap. Installs Xcode's "additional components", if necessary. Installs MacPorts and ports required by setup.
"${PLAYBOOK}" "${DIR}"/bootstrap-playbook.yml "$@"


# Local Variables:
# mode: sh
# sh-shell: zsh
# End:
