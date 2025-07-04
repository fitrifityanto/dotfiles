return {

	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {

			"hrsh7th/cmp-buffer", -- Source untuk buffer
			"hrsh7th/cmp-path", -- Source untuk path
			"hrsh7th/cmp-cmdline", -- Source untuk command line
			"saadparwaiz1/cmp_luasnip", -- Source untuk luasnip (jika menggunakan snippets)
			"L3MON4D3/LuaSnip", -- Snippet engine
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup({
				snippet = {

					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-a>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),

				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
			})

			cmp.setup.cmdline(":", {
				sources = cmp.config.sources({
					{ name = "path" },
					{ name = "cmdline" },
				}),
			})

			cmp.setup.cmdline("/", {
				sources = cmp.config.sources({
					{ name = "buffer" },
				}),
			})
		end,
	},

	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},

	"saadparwaiz1/cmp_luasnip",

	"hrsh7th/cmp-buffer",

	"hrsh7th/cmp-path",

	"hrsh7th/cmp-cmdline",
}
