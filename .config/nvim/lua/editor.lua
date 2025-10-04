vim.g.mapleader = " "

-- line number settins
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.cmd('highlight CursorLineNr ctermfg=white guifg=white')

vim.opt.clipboard = "unnamedplus"

-- tab settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "typescript", "html", "css", "svelte", "json", "lua" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end
})

-- keymap settings
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true })
vim.keymap.set('t', 'jk', '<C-\\><C-n>', { noremap = true })
vim.keymap.set('n', '<leader>cc', ':cclose<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Esc>', ':noh<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>gb', '<C-^>', { noremap = true })
