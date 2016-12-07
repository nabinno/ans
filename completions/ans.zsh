if [[ ! -o interactive ]]; then
    return
fi

compctl -K _ans ans

_ans() {
    local words completions
    read -cA words

    if [ "${#words}" -eq 2 ]; then
        completions="$(ans commands)"
    else
        completions="$(ans completions ${words[2,-2]})"
    fi

    reply=("${(ps:\n:)completions}")
}
