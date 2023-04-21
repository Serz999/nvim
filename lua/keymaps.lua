local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- Basic keymap
map('i' , 'jj', '<Esc>', opts)
map('i' , 'оо', '<Esc>', opts) -- For ru keymap

-- Turn off search highlight
map('n', '<leader><space>', ':nohlsearch<CR>', opts)

-- Go to next or prev tab by H and L accordingly
map('n', 'H', 'gT', opts)
map('n', 'L', 'gt', opts)

-- Telescope bindings
map('n', ',f', '<cmd>Telescope find_files<cr>', opts)
map('n', ',g', '<cmd>Telescope live_grep<cr>', opts)

-- Tagbar keymap
map('n', '<F8>', ':TagbarToggle<CR>', opts)
