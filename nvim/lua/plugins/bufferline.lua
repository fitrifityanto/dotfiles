return {
  'akinsho/bufferline.nvim',
  version = "*", 
  dependencies = 'nvim-tree/nvim-web-devicons', 
  config = function()
    require('bufferline').setup({
      options = {
        numbers = "none", 
        diagnostics = "nvim_lsp", 
        show_buffer_close_icons = false, 
        show_close_icon = false,
        offsets = {{
            filetype = "neo-tree",
            text = "File Explorer", 
            text_align = "left",
            separator = true
        }}, 
      }
    })
  end
}
