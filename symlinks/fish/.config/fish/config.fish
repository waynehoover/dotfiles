#https://github.com/fish-shell/fish-shell/issues/825#issuecomment-440286038
function up-or-search -d "Depending on cursor position and current mode, either search backward or move up one line"
    # If we are already in search mode, continue
    if commandline --search-mode
        commandline -f history-search-backward
        return
    end

    # If we are navigating the pager, then up always navigates
    if commandline --paging-mode
        commandline -f up-line
        return
    end

    # We are not already in search mode.
    # If we are on the top line, start search mode,
    # otherwise move up
    set lineno (commandline -L)

    switch $lineno
        case 1
            commandline -f history-search-backward
            history merge # <-- ADDED THIS

        case '*'
            commandline -f up-line
    end
end

set fish_greeting

set -x PATH ~/.cargo/bin /usr/local/opt/python/libexec/bin ~/go/bin ~/net/dev-bootstrap/bin $PATH
set -x GOPATH ~/go
set -x fish_user_paths "/usr/local/sbin" $fish_user_path

starship init fish | source
zoxide init fish | source
fnm env --multi | source

source ~/.exports.fish

abbr -a g git
abbr -a n netlify-api

