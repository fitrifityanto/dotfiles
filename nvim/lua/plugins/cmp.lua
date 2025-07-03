return {
  -- nvim-cmp: Completion engine utama
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter", -- Load plugin saat masuk mode Insert
    dependencies = {
      -- Source untuk nvim-cmp
      "hrsh7th/cmp-buffer",    -- Source untuk buffer
      "hrsh7th/cmp-path",      -- Source untuk path
      "hrsh7th/cmp-cmdline",   -- Source untuk command line
      "saadparwaiz1/cmp_luasnip", -- Source untuk luasnip (jika menggunakan snippets)
      "L3MON4D3/LuaSnip",      -- Snippet engine

      -- Sudah ada di konfigurasi LSP, tapi bisa juga di sini jika mau
      -- "hrsh7th/cmp-nvim-lsp",  -- Source untuk LSP (sudah kita tangani)
      -- "b0o/schemastore.nvim",  -- Untuk skema JSON/YAML (sudah kita tangani)
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          -- REQUIRED - ini penting agar snippets berfungsi dengan baik
          expand = function(args)
            luasnip.lsp_expand(args.body) -- Untuk integrasi dengan LuaSnip
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(), -- Untuk memicu completion secara manual
          ["<C-e>"] = cmp.mapping.abort(),         -- Untuk membatalkan completion
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Untuk memilih item dan menyisipkannya
        }),
        -- Tentukan source completion yang ingin Anda gunakan
        sources = cmp.config.sources({
          { name = "nvim_lsp" }, -- Ini adalah source dari cmp-nvim-lsp (untuk LSP)
          { name = "luasnip" },  -- Untuk snippets (dari LuaSnip)
          { name = "buffer" },   -- Kata-kata dari buffer yang sedang dibuka
          { name = "path" },     -- Path file
        }),
      })

      -- Setup untuk command line completion (opsional, tapi bagus)
      -- Untuk command mode (saat mengetik : )
      cmp.setup.cmdline(":", {
        sources = cmp.config.sources({
          { name = "path" },
          { name = "cmdline" },
        }),
      })

      -- Untuk search (saat mengetik / atau ? )
      cmp.setup.cmdline("/", {
        sources = cmp.config.sources({
          { name = "buffer" },
        }),
      })

      -- Opsional: Setup LuaSnip
      -- Anda bisa menambahkan snippets kustom di sini
      -- Misalnya: require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

  -- LuaSnip: Snippet engine (dependency dari nvim-cmp)
  {
    "L3MON4D3/LuaSnip",
    -- Konfigurasi LuaSnip bisa di sini jika diperlukan
    -- Misalnya: build = "make install_jsregexp",
    -- config = function()
    --   require("luasnip.loaders.from_vscode").lazy_load()
    -- end
  },

  -- Source untuk LuaSnip (dependency dari nvim-cmp)
  "saadparwaiz1/cmp_luasnip",

  -- Source untuk buffer (dependency dari nvim-cmp)
  "hrsh7th/cmp-buffer",

  -- Source untuk path (dependency dari nvim-cmp)
  "hrsh7th/cmp-path",

  -- Source untuk cmdline (dependency dari nvim-cmp)
  "hrsh7th/cmp-cmdline",

  -- Pastikan cmp-nvim-lsp sudah ada, seperti yang ada di konfigurasi lsp.lua Anda
  -- "hrsh7th/cmp-nvim-lsp",

  -- Pastikan schemastore.nvim sudah ada, seperti yang ada di konfigurasi lsp.lua Anda
  -- "b0o/schemastore.nvim",
}
