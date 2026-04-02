# Common shell functions and variables.

function _ansible_venv_() {
  local script_dir="${1}"
  shift || return 1
  echo "${script_dir}/.virtualenv"
}

function _ansible_venv_exe_() {
    local executable="${1}"
    local script_dir="${2}"
    shift || return 2
    echo "$(_ansible_venv_ "${script_dir}")"/bin/"${executable}"
}

function _ansible_pip_() {
    _ansible_venv_exe_ pip3 "$@"
}

function _ansible_galaxy_() {
    _ansible_venv_exe_ ansible-galaxy "$@"
}

function _ansible_playbook_() {
    _ansible_venv_exe_ ansible-playbook "$@"
}

function _ansible_home_() {
    local script_dir="${1}"
    shift || return 1

    echo "${script_dir}/.ansible"
}

function _run_ansible_playbook_() {
    local script_dir="${1}"
    local playbook="${2}"
    shift 2 || return 1

    local cmd
    cmd="$(_ansible_playbook_ "${script_dir}")"

    ANSIBLE_HOME="$(_ansible_home_ "${script_dir}")"
    export ANSIBLE_HOME

    "${cmd}" "${script_dir}/${playbook}" "$@"
}
