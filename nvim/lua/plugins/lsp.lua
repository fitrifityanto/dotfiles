return {

	{
		"neovim/nvim-lspconfig",
		dependencies = {

			{
				"mason-org/mason.nvim",
				cmd = "Mason",
				opts = {},
			},

			{
				"mason-org/mason-lspconfig.nvim",
				opts = {

					ensure_installed = {
						"lua_ls",
						"html",
						"cssls",
						"ts_ls",
						"astro",
						"yamlls",
						"taplo",
						"jsonls",
						-- "denols", -- Opsi lain untuk JS/TS jika Anda menggunakan Deno
					},
				},
			},
			-- cmp_nvim_lsp: Integrasi nvim-cmp dengan nvim-lspconfig untuk capabilities
			-- Pastikan Anda juga menginstal nvim-cmp dan source-nya (misal: nvim-cmp/cmp-nvim-lsp)
			{
				"hrsh7th/cmp-nvim-lsp",
			},
			-- schemastore.nvim: Untuk skema JSON/YAML otomatis
			{
				"b0o/schemastore.nvim",
			},
		},
		-- Konfigurasi LSP per bahasa
		config = function()
			local lspconfig = require("lspconfig")

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.diagnostic.config({
				virtual_text = true, -- Teks error/warning muncul di samping kode
				signs = true, -- Menampilkan simbol di gutter
				update_in_insert = false, -- Jangan update diagnostics saat di Insert mode
				severity_sort = true, -- Urutkan diagnostics berdasarkan severity
				float = { -- Konfigurasi popup saat hover
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			})

			local signs = { Error = "󰅖", Warn = "󰀩", Hint = "󰃰", Info = "󰋼" }
			for type, icon in pairs(signs) do
				local name = "DiagnosticSign" .. type
				vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
			end

			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
						},
					},
				},
			})

			-- Konfigurasi tsserver (JavaScript/TypeScript)
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})

			-- Konfigurasi html
			lspconfig.html.setup({
				capabilities = capabilities,
			})

			-- Konfigurasi cssls
			lspconfig.cssls.setup({
				capabilities = capabilities,
			})

			-- Konfigurasi astro
			lspconfig.astro.setup({
				capabilities = capabilities,
			})

			-- Konfigurasi yamlls
			lspconfig.yamlls.setup({
				capabilities = capabilities,
				settings = {
					yaml = {
						schemaStore = {
							enable = true,

							url = require("schemastore").yaml.schemas(),
						},
					},
				},
			})

			-- Konfigurasi taplo (TOML)
			lspconfig.taplo.setup({
				capabilities = capabilities,
			})

			-- Konfigurasi jsonls
			lspconfig.jsonls.setup({
				capabilities = capabilities,
				settings = {
					json = {

						schemas = require("schemastore").json.schemas(),
					},
				},
			})

			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "[G]o to [D]efinition" })
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "[G]o to [R]eferences" })
		end,
	},
}
