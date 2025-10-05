return {
  "sainnhe/everforest",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.everforest_background = 'hard'
    vim.g.everforest_better_performance = 1
    vim.g.everforest_better_performance = 1
    
    vim.cmd([[colorscheme everforest]])
    
    -- Manually clear backgrounds for transparency
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'NONE' })
  end,
}
