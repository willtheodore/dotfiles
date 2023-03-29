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
