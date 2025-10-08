return {
	"folke/snacks.nvim",
	-- Gunakan lazy = false agar plugin dimuat segera saat startup
	lazy = false,
	priority = 1000,

	-- Panggil fungsi setup di sini
	config = function()
		require("snacks").setup({
			notifier = { enabled = false },
		})
	end,
	-- Jika Anda memiliki konfigurasi khusus, letakkan di dalam opts = {}
	-- opts = {
	-- 	-- Contoh: aktifkan modul tertentu
	-- 	input = { enabled = true },
	-- },
}
