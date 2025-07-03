return {
  {
    "folke/trouble.nvim",
    cmd = "Trouble", -- Command untuk membuka/menutup trouble.nvim
    opts = {
      -- Opsi konfigurasi trouble.nvim
      -- Misalnya:
      -- use_diagnostic_signs = true, -- Menampilkan diagnostic signs di gutter
      -- auto_open = false,           -- Jangan otomatis membuka trouble window
      -- auto_close = true,           -- Otomatis menutup trouble window jika tidak ada diagnostics
    },
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
}
