vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer self instalation
    use 'wbthomason/packer.nvim'
 
    -- Color schemas
    use 'morhetz/gruvbox'

    -- Configurate
    use 'powerman/vim-plugin-ruscmd'

    ------------------------------------------ 
    -- IDE tools
    ------------------------------------------
    -- AutoSave
    use 'Pocco81/auto-save.nvim'
    -- Comments
    use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end } 
    -- Surrounds 
    use 'tpope/vim-surround'
    use 'cohama/lexima.vim'
    -- Search
    use {'nvim-telescope/telescope.nvim', tag = '0.1.1', requires = { {'nvim-lua/plenary.nvim'} }}    
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }  
    use 'https://github.com/preservim/tagbar'  
   
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- LSP
    use 'neovim/nvim-lspconfig' 
    use 'williamboman/nvim-lsp-installer'
    use 'ray-x/lsp_signature.nvim' -- show function signature, when you write args
    -- Autocomplite
    use {
        'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-nvim-lsp-signature-help',
			'hrsh7th/cmp-path',
            -- snippets support
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
		}
    }
end)
