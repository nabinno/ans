#!/bin/bin/env bash
set -e
ANS_DEBUG=
ANS_ROOT=

function install {
    if [ -d "${ANS_ROOT}" ]; then
        rm -fr ${ANS_ROOT}
    else
        git clone https://github.com/nabinno/ans ${ANS_ROOT}
    fi
}

function setup {
    local shell shellrc
    shell=$(basename $SHELL)
    case $shell in
        bash|zsh)
            shellrc=~/.${shell}rc
            echo 'export PATH="$HOME/.ans/bin:$PATH"' >> $shellrc
            echo 'eval "$(ans init -)"' >> $shellrc
            ;;
        fish)
            shellrc=~/.config/${shell}/config.${shell}
            echo 'set -x PATH "$HOME/.ans/bin:$PATH"' >> $shellrc
            echo 'eval "$(ans init -)"' >> $shellrc
            ;;
    esac
}

function main {
    if [ -z "${ANS_ROOT}" ]; then
        ANS_ROOT="${HOME}/.ans_test"
    else
        ANS_ROOT="${ANS_ROOT%/}"
    fi

    install && setup

    printf "${GREEN}"
    echo 'Ans ... is now installed!'
}

if [ "$1" = "--debug" ]; then
    ANS_DEBUG=1
    shift
fi
if [ -n "$ANS_DEBUG" ]; then
    PS4='+ [${BASH_SOURCE##*/}:${LINENO}] '
    set -x
fi

main
