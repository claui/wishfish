. 'libexec/ipv6_address.bash'

_print_help_text() {
  echo >&2 "Usage:   $(basename "${0}")" \
    "<interface> <ssh_arguments>"
  echo >&2 "Example: $(basename "${0}") en0 -p 22 user@example.com"
}

_wishfish() {
  local interface ip_address ssh_command

  interface="${1}"
  shift

  if [[ -z "${interface}" || $# -eq 0 ]]; then
    _print_help_text
    return 1
  fi

  ip_address="$(_ipv6_address "${interface}" || true)"
  if [[ ! "${ip_address}" ]]; then
    ip_address="$(ipconfig getifaddr ${interface} || true)"
  fi

  ssh_command="ssh"
  if [[ "${ip_address}" ]]; then
    ssh_command="${ssh_command} -b ${ip_address}"
  fi

  ${ssh_command} "$@"
}
