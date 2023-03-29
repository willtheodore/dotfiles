#!/opt/homebrew/bin/fish

set config_files alacritty fish karabiner nvim starship.toml
set files yarnrc skhdrc yabairc tmux.conf gitconfig

set dotfiles "$HOME/.dotfiles"

for file in $files
    set origin "$dotfiles/.$file"
    set target "$HOME/.$file"
    ln -sfv $origin $target
end

for file in $config_files
    set origin "$dotfiles/.config/$file"
    set target "$HOME/.config/"
    ln -sfv $origin $target
end
