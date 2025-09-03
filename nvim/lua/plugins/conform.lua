return {
	"stevearc/conform.nvim",
	lazy = true,
	event = "BufWritePre",
	cmd = { "ConformInfo" },
	opts = {

		formatters_by_ft = {
			html = { "prettier" },
			css = { "prettier" },
			javascript = { "prettier" },
			javascriptreact = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			astro = { "prettier" },
			yaml = { "prettier" },
			toml = { "taplo" },
			json = { "prettier" },
			lua = { "stylua" },
			markdown = { "prettier" },
		},

		log_level = vim.log.levels.DEBUG,
		format_on_save = {
			timeout_ms = 3000,
			lsp_fallback = true,
		},
	},

	dependencies = {

		"nvim-treesitter/nvim-treesitter",
		{
			"neovim/nvim-lspconfig",
			opts = {
				ensure_installed = {
					"html",
					"cssls",
					"ts_ls",
					"astro",
					"yamlls",
					"taplo",
					"jsonls",
					"lua_ls",
				},
			},
		},
	},
}
