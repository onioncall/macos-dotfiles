return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  -- ---@type snacks.Config
  opts = {
    -- bigfile = { enabled = true },
    -- dashboard = { enabled = true },
    explorer = { enabled = true },
    -- indent = { enabled = true },
    -- input = { enabled = true },
    picker = {
        enabled = true,
        mappings = {
            ["<C-k>"] = "previous", -- For Windows/Linux
            ["<D-k>"] = "previous", -- For Mac (Command key)
        },
    },
    -- notifier = { enabled = true },
    -- quickfile = { enabled = true },
    -- scope = { enabled = true },
    -- scroll = { enabled = true },
    -- statuscolumn = { enabled = true },
    -- words = { enabled = true },
  },
  keys = {
    { "<C-p>", function() require('snacks').picker.files({
        exclude = { "^bin$", "^obj$" }
    }) end, desc = "Find Files"},
    { "<C-j>", function() require('snacks').explorer({
        auto_close = true
    }) end, desc = "Reveal File Explorer" },
  }
}
