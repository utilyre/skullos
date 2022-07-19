local notify = require("notify")
local dressing = require("dressing")
local autopairs = require("nvim-autopairs")
local comment = require("Comment")
local fterm = require("FTerm")

vim.notify = notify

notify.setup({
  stages = "slide",
  background_colour = "NormalFloat",
  icons = {
    ERROR = _G.symbols.diagnostic.Error,
    WARN = _G.symbols.diagnostic.Warn,
    INFO = _G.symbols.diagnostic.Info,
  },
})

dressing.setup({
  input = {
    enabled = true,
    relative = "editor",
    border = "rounded",
    winblend = 0,
    insert_only = false,
  },
  select = {
    enabled = true,
  },
})

autopairs.setup({
  check_ts = true,
})

comment.setup({
  mappings = {
    basic = true,
    extra = true,
    extended = true,
  },
})

_G.terminals = {}
local toggle_terminal = function(name)
  if _G.terminals[name] == nil then
    _G.terminals[name] = fterm:new({
      hl = "NormalFloat",
      border = "rounded",
      on_exit = function()
        if _G.lastname == name then _G.lastname = nil end
        terminals[name] = nil
      end,
    })
  end

  _G.lastname = name
  _G.terminals[name]:toggle()
end

vim.keymap.set("n", "\\", function()
  local name = vim.fn.getcharstr()
  if name == "" then return end

  toggle_terminal(name)
end)
vim.keymap.set({ "n", "t" }, "<c-\\>", function()
  if _G.lastname == nil then return end
  toggle_terminal(_G.lastname)
end)
