set encoding=utf-8
set mouse=a
set number
set relativenumber
set noswapfile
set scrolloff=7

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix
filetype indent on

call plug#begin('~/.vim/plugged')

Plug 'nvim-lua/plenary.nvim'

" Color schemas
Plug 'morhetz/gruvbox'

" LSP config
Plug 'neovim/nvim-lspconfig'

" Autocomplete
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

" IDE tools
Plug 'Pocco81/auto-save.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
call plug#end()

" Colorsheme settings
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
if (has("termguicolors"))
    set termguicolors
endif

" Enables cursor line position tracking:
set cursorline
" Removes the underline causes by enabling cursorline:
highlight clear CursorLine
" Sets the line numbering to red background:
highlight CursorLineNR ctermbg=red 

" Netrw file explorer settings
let g:netrw_banner = 0 " hide banner above files
let g:netrw_liststyle = 3 " tree instead of plain view
let g:netrw_browse_split = 3 " vertical split window when Enter pressed on file

" Bindings
inoremap jj <esc>

" Go to next or prev tab by H and L accordingly
nnoremap H gT
nnoremap L gt

" Turn off search highlight
nnoremap ,<space> :nohlsearch<CR>

" Telescope bindings
nnoremap ,f <cmd>Telescope find_files<cr>
nnoremap ,g <cmd>Telescope live_grep<cr>

" Telescope fzf plugin
lua << EOF
require('telescope').load_extension('fzf')
EOF
