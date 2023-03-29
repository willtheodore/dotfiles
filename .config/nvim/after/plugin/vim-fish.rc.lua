local status, fish = pcall(require, "vim-fish")
if (not status) then return end

fish.setup{}

