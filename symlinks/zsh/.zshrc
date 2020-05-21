eval "$(starship init zsh)"
eval "$(~/.cargo/bin/zoxide init zsh)"

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

export PATH=~/.cargo/bin:/usr/local/opt/python/libexec/bin:~/go/bin:~/net/dev-bootstrap/bin:$PATH
export NETLIFY_API_SRC=/Users/waynehoover/net/bitballoon
export NETLIFY_UI_SRC=/Users/waynehoover/net/netlify-react-ui
export NETLIFY_DEV_BOOTSTRAP_SRC=/Users/waynehoover/net/dev-bootstrap
export GOPATH=~/go

alias g=git

HISTFILE="$HOME/.zsh_history"
HISTSIZE=1024
SAVEHIST=1024

# Don't log commands beginning with a space.
setopt HIST_IGNORE_SPACE

# Ignore duplicates in history.
setopt HIST_SAVE_NO_DUPS

# Append to history on shell exit rather than overwrite.
setopt APPENDHISTORY

# Store history immediately rather than at end of session.
setopt INC_APPEND_HISTORY

# Allow comments like this in shell.
setopt INTERACTIVECOMMENTS

# Don't beep when auto-completing.
unsetopt LIST_BEEP
