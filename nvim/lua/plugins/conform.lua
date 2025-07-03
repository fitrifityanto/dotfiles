return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	cmd = { "ConformInfo" },
	opts = {

		formatters_by_ft = {
			html = { "prettierd", "prettier" },
			css = { "prettierd", "prettier" },
			javascript = { "prettierd", "prettier" },
			javascriptreact = { "prettierd", "prettier" },
			typescript = { "prettierd", "prettier" },
			typescriptreact = { "prettierd", "prettier" },
			astro = { "prettierd", "prettier" },
			yaml = { "prettierd", "prettier" },
			toml = { "taplo" },
			json = { "prettierd", "prettier" },
			lua = { "stylua" },
			markdown = { "prettierd", "prettier" },
		},

		log_level = vim.log.levels.ERROR,
		format_on_save = {
			timeout_ms = 500,
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
				},
			},
		},
	},
}
