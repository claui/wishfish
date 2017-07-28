_print_help_text() {
  echo >&2 "Usage:   $(basename "${0}") <interface>"
  echo >&2 "Example: $(basename "${0}") en0"
}

_ipv6_address() {
  local interface="${1}"

  if [[ ! ${interface} ]]; then
    _print_help_text
    return 1
  fi

  ifconfig "${interface}" inet6 \
    | awk -e "$(cat << 'EOF'
        NR==1 && /UP/ { up = 1 }
        NR==1 && !up { exit 1 }
        /inet6/ && !done { print $2; done = 1 }
        ENDFILE { exit !done }
EOF
      )"
}
