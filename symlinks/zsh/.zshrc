eval "$(starship init zsh)"
eval "$(~/.cargo/bin/zoxide init zsh)"

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

source ~/.exports

export PATH=~/.cargo/bin:/usr/local/opt/python/libexec/bin:~/go/bin:~/net/dev-bootstrap/bin:$PATH
export GOPATH=~/go

alias g=git
alias n=netlify-api

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

source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
