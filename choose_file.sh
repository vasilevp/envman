#!/bin/bash
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo "this file is not an executable; please run envman instead" >&2
    exit 1
fi

choose_file() {
    list=$1
    msg=$2
    echo "$msg"
    declare -i i
    i=1
    for c in $list; do
        basename=$(basename "$c")
        echo "  " $i. "$basename"
        ((i++))
    done

    local mc=($list)

    declare -i -g selection
    read -p "Enter value: " -e -i "${!3}" -r selection

    if [ "$selection" -lt 1 ] || [ "$selection" -ge $i ]; then
        echo error: expected selection between 1 and $((i - 1)), got "$selection" >&2
        exit 1
    fi

    local result=${mc[(($selection - 1))]}
    echo Selected: "$(basename "$result")"
    declare -g "$3"="$result"
    echo
}
