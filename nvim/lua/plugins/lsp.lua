return {
  -- nvim-lspconfig: Konfigurasi default untuk LSP server
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- mason.nvim: Manager untuk LSP server, linter, dan formatter
      {
        "mason-org/mason.nvim",
        cmd = "Mason",
        opts = {
          -- Tambahkan konfigurasi Mason di sini jika ada (opsional)
        },
      },
      -- mason-lspconfig.nvim: Integrasi Mason dengan nvim-lspconfig
      {
        "mason-org/mason-lspconfig.nvim",
        opts = {
          -- Daftar LSP server yang ingin diinstal secara otomatis
          ensure_installed = {
            "html",
            "cssls",
            "ts_ls", -- Untuk JavaScript dan TypeScript
            "astro",
            "yamlls",
            "taplo", -- Untuk TOML
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
      -- Pastikan cmp_nvim_lsp sudah di-require untuk capabilities
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.diagnostic.config({
        virtual_text = true,      -- Teks error/warning muncul di samping kode
        signs = true,             -- Menampilkan simbol di gutter
        update_in_insert = false, -- Jangan update diagnostics saat di Insert mode
        severity_sort = true,     -- Urutkan diagnostics berdasarkan severity
        float = {                 -- Konfigurasi popup saat hover
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

      -- Konfigurasi tsserver (JavaScript/TypeScript)
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        -- Tambahkan opsi lain di sini jika diperlukan
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
              -- Menggunakan schemastore.nvim untuk skema YAML
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
            -- Menggunakan schemastore.nvim untuk skema JSON
            schemas = require("schemastore").json.schemas(),
          },
        },
      })
    end,
  },
}
