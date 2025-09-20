return {
    -- 1. Plugin Mason (LSP server manager)
    {
        "mason-org/mason.nvim",
        cmd = "Mason",
        opts = {},
    },

    -- 2. Plugin Mason-LSPconfig (menghubungkan Mason & nvim-lspconfig)
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim",
        },
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
            },
            handlers = {
                -- Handler default untuk semua server
                function(server_name)
                    require("lspconfig")[server_name].setup({})
                end,
                -- Handler khusus untuk lua_ls
                lua_ls = function()
                    require("lspconfig").lua_ls.setup({
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
                end,
                -- Handler khusus untuk yamlls
                yamlls = function()
                    require("lspconfig").yamlls.setup({
                        settings = {
                            yaml = {
                                schemaStore = {
                                    enable = true,
                                    url = require("schemastore").yaml.schemas(),
                                },
                            },
                        },
                    })
                end,
                -- Handler khusus untuk jsonls
                jsonls = function()
                    require("lspconfig").jsonls.setup({
                        settings = {
                            json = {
                                schemas = require("schemastore").json.schemas(),
                            },
                        },
                    })
                end,
            },
        },
    },

    -- 3. Plugin nvim-lspconfig (Konfigurasi LSP umum)
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "mason-org/mason-lspconfig.nvim", -- Pastikan mason-lspconfig adalah dependensi di sini
            "hrsh7th/cmp-nvim-lsp",
            "b0o/schemastore.nvim",
        },
        config = function()
            -- Konfigurasi diagnostik dan keymap, dll.
            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                update_in_insert = false,
                severity_sort = true,
                float = {
                    border = "rounded",
                    source = "always",
                    header = "",
                    prefix = "",
                },
            })

            local signs = { Error = "", Warn = "", Hint = "", Info = "" }
            for type, icon in pairs(signs) do
                local name = "DiagnosticSign" .. type
                vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
            end

            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "[G]o to [D]efinition" })
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "[G]o to [R]eferences" })
        end,
    },

    -- 4. Plugin lainnya
    {
        "hrsh7th/cmp-nvim-lsp",
    },
    {
        "b0o/schemastore.nvim",
    },
}
