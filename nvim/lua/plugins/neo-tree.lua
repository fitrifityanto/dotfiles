return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,

	opts = {
		filesystem = {
			filtered_items = {
				visible = true, -- tampilkan item yang difilter (dengan warna redup)
				hide_dotfiles = false, -- tetap tampilkan file yang diawali "."
				hide_gitignored = true,
				hide_by_name = {
					"node_modules",
					".DS_Store",
				},
				never_show = {
					"thumbs.db",
				},
			},
		},
	},

	config = function(_, opts)
		require("neo-tree").setup(opts)

		-- Keymap
		vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", { noremap = true, silent = true })
	end,
}
