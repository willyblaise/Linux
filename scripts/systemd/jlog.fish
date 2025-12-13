#!/usr/bin/env fish

function require_fzf
    if not type -q fzf
        echo "fzf is required but not installed."
        return 1
    end
end

function pick_service
    systemctl list-units --type=service --all \
        | awk '{print $1}' \
        | grep '\.service$' \
        | sort \
        | fzf --prompt="Select service> "
end

function pick_boot
    journalctl --list-boots \
        | fzf --prompt="Select boot> " \
        | awk '{print $1}'
end

function usage
    echo "jlog.fish (Fish + fzf)"
    echo
    echo "Commands:"
    echo "  service        Pick service → view logs"
    echo "  follow         Pick service → follow logs"
    echo "  errors         Pick service → error logs"
    echo "  boot           Pick boot → view logs"
    echo "  kernel         Pick boot → kernel logs"
    echo "  disk           Journal disk usage"
    echo
    echo "Examples:"
    echo "  jlog service"
    echo "  jlog follow"
end

# ---- argument handling ----
set cmd $argv[1]

if test -z "$cmd"
    usage
    exit 0
end

switch $cmd
    case service
        require_fzf; or exit 1
        set svc (pick_service)
        test -z "$svc"; and exit 0
        journalctl -u $svc

    case follow
        require_fzf; or exit 1
        set svc (pick_service)
        test -z "$svc"; and exit 0
        journalctl -u $svc -f

    case errors
        require_fzf; or exit 1
        set svc (pick_service)
        test -z "$svc"; and exit 0
        journalctl -u $svc -p err

    case boot
        require_fzf; or exit 1
        set boot (pick_boot)
        test -z "$boot"; and exit 0
        journalctl -b $boot

    case kernel
        require_fzf; or exit 1
        set boot (pick_boot)
        test -z "$boot"; and exit 0
        journalctl -k -b $boot

    case disk
        journalctl --disk-usage

    case -h --help
        usage

    case '*'
        echo "Unknown command: $cmd"
        usage
        exit 1
end
