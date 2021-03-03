anyenv() {
  unfunction "$0"
  source <(anyenv init -)
  $0 "$@"
}

pyenv() {
  unfunction "$0"
  source <(pyenv init -)
  source <(pyenv virtualenv-init -)
  $0 "$@"
}

jenv() {
  unfunction "$0"
  source <(jenv init -)
  $0 "$@"
}
