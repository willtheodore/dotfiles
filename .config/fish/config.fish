# FISH CONFIG - Will Theodore

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /Users/willtheodore/opt/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

begin # VIM MODE
    set fish_cursor_default block
    set fish_cursor_insert line blink
    set fish_cursor_replace_one underscore
    set fish_cursor_visual block
end

begin ## HOMEWBREW CONFIGS
    zoxide init fish | source
    starship init fish | source
end

begin ## Env Vars
    set DOTFILES $HOME/.dotfiles
    set FISH_CONFIG $HOME/.config/fish/config.fish
end

begin ## Abbreviations
    abbr -a pass sh ~/.emorypass.sh
    abbr -a glo git log --oneline
    abbr -a ga git add -A
    abbr -a gc git commit -m
    abbr -a gp git push
    abbr -a gco git checkout
    abbr -a gs git status
end

## SOURCING
tmux source-file ~/.tmux.conf
fish_user_key_bindings
