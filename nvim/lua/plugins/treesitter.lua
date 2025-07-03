return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup({

      ensure_installed = {
        "html",
        "css",
        "javascript",
        "typescript",
        "lua",
        "markdown",
        "json",
        "yaml",
        "toml",
        "astro",
      },

      highlight = {
        enable = true,
      },

      indent = { enable = true },



    })
  end,
}
