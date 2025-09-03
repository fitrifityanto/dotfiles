return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		{
			"wuelnerdotexe/vim-astro",
		},
	},
	config = function()
		require("nvim-treesitter.configs").setup({

			ensure_installed = {
				"html",
				"css",
				"javascript",
				"typescript",
				"lua",
				"markdown",
				"json",
				"yaml",
				"toml",
				"astro",
			},

			highlight = {
				enable = true,
			},

			indent = { enable = true },
			sync_install = false,
			ignore_install = {},
			auto_install = true,
		})
	end,
}
