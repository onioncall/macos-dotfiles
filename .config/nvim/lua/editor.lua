vim.cmd("set softtabstop=0 noexpandtab")
vim.g.mapleader = " "
vim.cmd("set nu rnu")
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('t', 'jk', '<C-\\><C-n>', { noremap = true })
vim.keymap.set('n', '<leader>cc', ':cclose<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>rh', ':noh<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>gb', '<C-^>', { noremap = true })
vim.cmd("set clipboard=unnamedplus")

-- Line Numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.cmd('highlight CursorLineNr ctermfg=white guifg=white')

-- Default for all files
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- File-specific settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"javascript", "typescript", "html", "css", "svelte", "json", "lua"},
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end
})
