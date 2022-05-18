local state = require("bufferline.state")
local whichkey = require("which-key")

vim.g.bufferline = {
  semantic_letters = false,
  icon_pinned = "",
  icon_separator_active = "",
  icon_separator_inactive = "",
}

local gBarbar = vim.api.nvim_create_augroup("Barbar", {})
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = gBarbar,
  callback = function()
    if vim.bo.filetype ~= "NvimTree" then return end
    state.set_offset(40, "Explorer")
  end
})
vim.api.nvim_create_autocmd("BufWinLeave", {
  group = gBarbar,
  callback = function()
    if not vim.fn.expand("<afile>"):match("NvimTree") then return end
    state.set_offset(0)
  end
})

whichkey.register({
  n = { "<cmd>enew<cr>", "New" },
  w = { "<cmd>write<cr>", "Save" },
  q = { "<cmd>quitall<cr>", "Quit" },
  c = { "<cmd>BufferClose<cr>", "Close" },
  m = { "<cmd>BufferPin<cr>", "Mount" },
  s = { "<cmd>BufferPick<cr>", "Select" },
  h = { "<cmd>BufferPrevious<cr>", "Previous" },
  l = { "<cmd>BufferNext<cr>", "Next" },
}, { prefix = "<leader>" })
