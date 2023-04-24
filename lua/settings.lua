local cmd = vim.cmd
local opt = vim.opt
local g = vim.g

-- Global variables
g.netrw_banner = 0            -- Hide banner above files
g.netrw_liststyle = 3 	      -- Tree instead of plain view
g.netrw_browse_split = 3      -- Vertical split window when Enter pressed on file
g.gruvbox_contrast_dark = 'hard'
g.mapleader = ','

-----------------------------------------------------------
-- Main
-----------------------------------------------------------
opt.encoding = 'utf-8'
opt.mouse = 'a'
opt.number = true
opt.relativenumber = true
opt.scrolloff = 7
opt.spelllang = { 'en_us', 'ru' } 
cmd('set noswapfile')
cmd('syntax on')

-- Tabs and indent
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.fileformat = 'unix'
cmd('filetype indent on')
-----------------------------------------------------------
-- Color scheme
-----------------------------------------------------------
opt.termguicolors = true      --  24-bit RGB colors
cmd('colorscheme gruvbox')

-- Cursorlune settings
cmd([[
    set cursorline
	highlight clear CursorLine
    highlight! CursorLineNR guibg=NONE ctermbg=NONE
    ]])
-----------------------------------------------------------
-- Setups for plugins
-----------------------------------------------------------
-- Telescope fzf setup
require('telescope').load_extension('fzf')

require('lualine').setup{}

-- lualine
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'filename'},
    lualine_b = {'diagnostics'},
    lualine_c = {''},
    lualine_x = {'encoding', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}


-- luasnip setup
local luasnip = require 'luasnip'
local async = require "plenary.async"


-- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
			require'luasnip'.lsp_expand(args.body) -- Luasnip expand
		end,
    },

    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },

    completion = {
        completeopt = 'menu,menuone,noinsert',
        max_items = 5,
    },

    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),

    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
      { name = 'path' },
      -- { name = 'nvim_lsp_signature_help' },
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })



