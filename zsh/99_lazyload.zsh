jenv() {
  unfunction "$0"
  source <(jenv init -)
  $0 "$@"
}
