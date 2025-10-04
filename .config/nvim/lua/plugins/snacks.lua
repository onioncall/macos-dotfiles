return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    explorer = { enabled = true },
    picker = {
        enabled = true,
        mappings = {
            ["<C-k>"] = "previous",
            ["<D-k>"] = "previous",
        },
    },
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
