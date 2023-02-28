#!/usr/bin/env bash
# setting bash strict mode
set -o errexit
set -o pipefail
set -o nounset
IFS=$'\n\t'

# logging functions
function __msg_error() {
    printf '\e[1;31m[ERROR]: %s\n\e[0m' "${1}" >&2
}

function __msg_info() {
    printf '\e[1;33m[INFO]: %s\n\e[0m' "${1}"
}

function install_pyenv() {
    type pyenv >/dev/null 2>&1
    if [ $? -eq 1 ]; then
        # installing pyenv using pyenv-installer if it is not installed yet
        __msg_info "Cannot find pyenv tool. Installing it!"
        __msg_info "Check all prerequisitues are met: https://github.com/pyenv/pyenv/wiki#suggested-build-environment"

        curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
        if [$? -ne 0 ]; then
            __msg_error "Cannot install pyenv! Check that you have Internet connection and all prerequisitues are met: https://github.com/pyenv/pyenv/wiki#suggested-build-environment"
            exit 1
        fi

        if ! grep -q 'export PATH="${HOME}/.pyenv/bin:$PATH"' "$HOME/.bashrc2" >/dev/null 2>&1; then
            {
                echo ''
                echo '# pyenv'
                echo 'export PATH="${HOME}/.pyenv/bin:$PATH"'
                echo 'eval "$(pyenv init -)"'
                echo 'eval "$(pyenv virtualenv-init -)"'
            } >>"$HOME/.bashrc2"
        fi

        # echo '' >>~/.bashrc
        # echo '# pyenv' >>~/.bashrc
        # echo 'export PATH="${HOME}/.pyenv/bin:$PATH"' >>~/.bashrc
        # echo 'eval "$(pyenv init -)"' >>~/.bashrc
        # echo 'eval "$(pyenv virtualenv-init -)"' >>~/.bashrc

        # activating for the current shell session
        export PATH="${HOME}/.pyenv/bin:$PATH"
        eval "$(pyenv init -)"
        eval "$(pyenv virtualenv-init -)"

        exec "$SHELL"
    else
        # installing pyenv using pyenv-installer if it is not installed yet
        __msg_info "pyenv is found! Updating it!"
        pyenv update
    fi
}

# main script part
echo "Starting..."

echo "Exiting..."
