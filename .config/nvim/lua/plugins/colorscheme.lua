return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			color_overrides = {
				mocha = {
					base = "#252323",
          text = "#FFE551", -- "#F9F6F0", -- Cream
					--
					-- All restored to default Catppuccin values
					-- rosewater = "#F5E0DC", -- Filenames, special methods, etc.
					-- flamingo = "#F2CDCD",  -- Methods, functions
					-- pink = "#F5C2E7",      -- Numbers, booleans
					mauve = "#f98441",     -- Classes, types, primitives #CBA6F7
					-- red = "#F38BA8",       -- Errors, deletions
					-- maroon = "#74C7EC",    -- Special keywords, return
					-- peach = "#FAB387",     -- Constants, imports, TBD
					yellow = "#fcda51",    -- Fields, properties, attributes
					green = "#44992b", -- "#fb6c25",     -- Strings, additions
					-- teal = "#94E2D5",      -- Operators, special symbols
					-- sky = "#89DCEB",       -- Static types
					-- sapphire = "#fad49c",  -- Keywords like if, for, while
					blue =  "#8cc15d", -- "#fabf24",      -- Functions, methods
					lavender = "#fdca43",  -- Variables
				}
			},
			transparent_background = {
				true
			},
			-- term_colors = {
			-- 	true
			-- },
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				notify = false,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
			},
		})
		vim.cmd("colorscheme catppuccin")
	end
}
