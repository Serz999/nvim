local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- Basic keymap
map('i' , 'jj', '<Esc>', opts)
map('i' , 'оо', '<Esc>', opts) -- For ru keymap

-- Turn off search highlight
map('n', '<leader><space>', ':nohlsearch<CR>', opts)

-- Buffers managment 
map('n', 'H', ':BufferLineCyclePrev<CR>', opts)
map('n', 'L', ':BufferLineCycleNext<CR>', opts)
map ('n', 'q', ':bd<CR>', opts)

-- Telescope bindings
map('n', ',f', '<cmd>Telescope find_files<cr>', opts)
map('n', ',g', '<cmd>Telescope live_grep<cr>', opts)

-- NvimTree keymap
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)
map('n', '<C-n>', ':NvimTreeToggle<CR>', opts)
map('n', '<C-v>', '<C-w>v', opts)

-- Tagbar keymap
map('n', '<F8>', ':TagbarToggle<CR>', opts)

