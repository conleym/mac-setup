# Common shell functions and variables.

function _ansible_venv_() {
  local script_dir="${1}"
  shift || return 1
  echo "${script_dir}/.virtualenv"
}

function _ansible_pip_() {
    local script_dir="${1}"
    shift || return 1
    echo "$(_ansible_venv_ "${script_dir}")"/bin/pip3
}

function _ansible_galaxy_() {
    local script_dir="${1}"
    shift || return 1
    echo "$(_ansible_venv_ "${script_dir}")"/bin/ansible-galaxy
}

function _ansible_playbook_() {
    local script_dir="${1}"
    shift || return 1
    echo "$(_ansible_venv_ "${script_dir}")"/bin/ansible-playbook
}
