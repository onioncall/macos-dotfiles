return  {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup({
        PATH = "prepend",
        -- registries = {
        --   "github:mason-org/mason-registry",
        --   "github:Crashdummyy/mason-registry",
        -- },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "tsserver",
        "gopls",
        "csharp_ls",
        "zls",
      }
    })
  end
  },
}
