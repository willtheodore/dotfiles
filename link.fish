#!/opt/homebrew/bin/fish

set config_files alacritty fish karabiner nvim starship.toml
set files yarnrc skhdrc yabairc tmux.conf

set dotfiles "$HOME/.dotfiles"

for file in $files
    set origin "$dotfiles/.$file"
    set target "$HOME/.$file"
    ln -sv $origin $target
end

for file in $config_files
    set origin "$dotfiles/.config/$file"
    set target "$HOME/.config/"
    ln -sv $origin $target
end
