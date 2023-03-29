local status, packer = pcall(require, "packer")
if (not status) then
    print("Packer is not installed.")
    return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
    -- CORE
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim' -- common utils
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ":TSUpdate"
    }

    -- Colorschemes + graphics
    use 'sainnhe/gruvbox-material'
    use 'tomasr/molokai'
    use 'drewtempelmeyer/palenight.vim'
    use 'kyazdani42/nvim-web-devicons'
    use 'yuttie/sublimetext-spacegray.vim'
    use 'lewis6991/gitsigns.nvim'

    -- LSP
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        'neovim/nvim-lspconfig',
        run = ":MasonUpdate" -- :MasonUpdate updates registry contents
    }
    use 'hrsh7th/nvim-cmp'
    use 'onsails/lspkind-nvim' -- vscode-like pictogram
    use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
    use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
    use 'glepnir/lspsaga.nvim' -- LSP UIs
    use 'dag/vim-fish' -- Fish Scripts

    -- Code Formatting
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'MunifTanjim/prettier.nvim'
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'
    use 'tomtom/tcomment_vim'

    -- Telescope
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-file-browser.nvim'

    -- Harpoon
    use 'ThePrimeagen/harpoon'

    -- Status Line
    use 'nvim-lualine/lualine.nvim'
end)
