local bufferline = require("bufferline")
bufferline.setup({
  options = {
    indicator_icon = "▎",
    modified_icon = "●",
    show_close_icon = false,
    show_buffer_close_icons = false,
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
  },
})
