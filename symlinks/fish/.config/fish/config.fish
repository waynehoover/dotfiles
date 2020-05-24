set fish_greeting

set -x PATH $PATH ~/.cargo/bin /usr/local/opt/python/libexec/bin ~/go/bin ~/net/dev-bootstrap/bin

starship init fish | source
zoxide init fish | source

export GOPATH=~/go

abbr -a g git
abbr -a n netlify-api
