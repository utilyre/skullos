local noice = require("noice")

noice.setup({
  presets = {
    command_palette = true,
    lsp_doc_border = true,
  },
  cmdline = {
    enabled = true,
    format = {
      cmdline = {
        title = " Palette ",
        icon = ":",
      },
      search_down = {
        title = " Find ",
        icon = "/",
      },
      search_up = {
        title = " Find ",
        icon = "?",
      },
    },
  },
  popupmenu = {
    enabled = true,
    backend = "cmp",
  },
  lsp = {
    hover = {
      enabled = false,
    },
    signature = {
      enabled = true,
    },
    progress = {
      enabled = true,
    },
  },
  views = {
    mini = {
      zindex = 40,
    },
  },
})
