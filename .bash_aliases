alias k='kubectl'
complete -F __start_kubectl k

if [ -f "/usr/share/bash-completion/completions/git" ]; then
  alias g='git'
  source /usr/share/bash-completion/completions/git
  __git_complete g __git_main
fi

