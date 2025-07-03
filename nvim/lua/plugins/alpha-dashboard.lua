return {
	"goolord/alpha-nvim",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		local header_content = {
			"███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
			"████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
			"██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
			"██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
			"██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
			"╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
			"                                                  ",
		}

		-- Menambahkan tanggal dan waktu saat ini ke header
		local current_time = os.date("%A, %B %d, %Y %I:%M %p")
		table.insert(header_content, "")
		table.insert(header_content, "Semangat ngoding!")
		table.insert(header_content, current_time)
		table.insert(header_content, "")

		-- Konfigurasi Header Section
		dashboard.section.header.val = header_content
		dashboard.section.header.opts.hl = "AlphaHeader"

		-- Konfigurasi Buttons Section
		dashboard.section.buttons.val = {
			dashboard.button("n", "  New File", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "  Find File", ":Telescope find_files <CR>"),
			dashboard.button("g", " Find Word", ":Telescope live_grep <CR>"),
			dashboard.button("q", "  Quit Neovim", ":qa <CR>"),
		}
		dashboard.section.buttons.opts.hl = "AlphaButtons"

		-- Mengatur layout dashboard
		dashboard.layout = {
			{ type = "padding", val = 2 },
			{ type = "header", align_val = "center" },
			{ type = "padding", val = 2 },
			{ type = "buttons", align_val = "center" },
			{ type = "padding", val = 2 },

			{ type = "padding", val = 2 },
		}

		-- Define custom highlight groups
		vim.cmd([[ highlight AlphaHeader guifg=#f9e2af guibg=NONE gui=bold ]])
		vim.cmd([[ highlight AlphaButtons guifg=#f9e2af guibg=NONE ]])

		alpha.setup(dashboard.opts)
	end,
}
