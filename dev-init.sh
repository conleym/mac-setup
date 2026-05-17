#!/usr/bin/env zsh

# Install ansible development tools, etc., useful for those working on playbooks.

# shellcheck disable=SC2296
SCRIPT="${(%):-%x}"
DIR="$( cd "$( dirname "${SCRIPT}" )" >/dev/null 2>&1 && pwd )"

source "${DIR}/common.sh"

PIP="$(_ansible_pip_ "${DIR}")"

"${PIP}" install --upgrade -r "${DIR}"/dev-requirements.txt --no-warn-script-location


# Local Variables:
# mode: sh
# sh-shell: zsh
# End:
