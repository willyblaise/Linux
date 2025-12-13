#!/usr/bin/env bash

set -euo pipefail

require_fzf() {
  command -v fzf >/dev/null 2>&1 || {
    echo "fzf is required but not installed."
    exit 1
  }
}

pick_service() {
  systemctl list-units --type=service --all \
    | awk '{print $1}' \
    | grep '\.service$' \
    | sort \
    | fzf --prompt="Select service: "
}

pick_boot() {
  journalctl --list-boots \
    | fzf --prompt="Select boot: " \
    | awk '{print $1}'
}

usage() {
cat <<'EOF'
journal-helper.sh (fzf enabled)

Commands:
  fzf-service            Pick service → view logs
  fzf-follow             Pick service → follow logs
  fzf-errors             Pick service → error logs
  fzf-boot               Pick boot → view logs
  fzf-kernel             Pick boot → kernel logs
  errors                 System errors (this boot)
  disk                   Journal disk usage

Examples:
  ./journal-helper.sh fzf-service
  ./journal-helper.sh fzf-follow
EOF
}

cmd="${1:-}"

case "$cmd" in
  fzf-service)
    require_fzf
    svc=$(pick_service)
    [ -z "$svc" ] && exit 0
    journalctl -u "$svc"
    ;;

  fzf-follow)
    require_fzf
    svc=$(pick_service)
    [ -z "$svc" ] && exit 0
    journalctl -u "$svc" -f
    ;;

  fzf-errors)
    require_fzf
    svc=$(pick_service)
    [ -z "$svc" ] && exit 0
    journalctl -u "$svc" -p err
    ;;

  fzf-boot)
    require_fzf
    boot=$(pick_boot)
    [ -z "$boot" ] && exit 0
    journalctl -b "$boot"
    ;;

  fzf-kernel)
    require_fzf
    boot=$(pick_boot)
    [ -z "$boot" ] && exit 0
    journalctl -k -b "$boot"
    ;;

  errors)
    journalctl -p err -b
    ;;

  disk)
    journalctl --disk-usage
    ;;

  -h|--help|"")
    usage
    ;;

  *)
    echo "Unknown command: $cmd"
    usage
    exit 1
    ;;
esac
