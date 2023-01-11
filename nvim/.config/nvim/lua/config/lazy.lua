local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.fs.exists(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--single-branch",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

local lazy = require("lazy")

lazy.setup("config.plugins", {
  concurrency = 4,
  install = {
    colorscheme = { "tokyonight", "habamax" },
  },
  dev = {
    path = vim.fs.normalize("$XDG_DOCUMENTS_HOME"),
  },
  ui = {
    border = "rounded",
    icons = {
      not_loaded = vim.g.icons.widget.outline.Circle,
      loaded = vim.g.icons.widget.inline.Circle,
      task = vim.g.icons.widget.inline.Clipboard,
      source = vim.g.icons.widget.inline.Fire,
      start = vim.g.icons.widget.inline.Play,
      plugin = vim.g.icons.widget.inline.Archive,
      event = vim.g.icons.widget.inline.Bolt,
      keys = vim.g.icons.widget.outline.Keyboard,
      cmd = vim.g.icons.widget.inline.Usd,
      ft = vim.g.icons.widget.inline.Code,
      init = vim.g.icons.widget.inline.Flask,
      runtime = vim.g.icons.widget.inline.Vim,
      import = vim.g.icons.widget.inline.PaperClip,
      config = vim.g.icons.widget.inline.Gear,
    },
  },
})

vim.keymap.set("n", "<leader>ph", vim.callback(lazy.home))
vim.keymap.set("n", "<leader>pi", vim.callback(lazy.install))
vim.keymap.set("n", "<leader>pu", vim.callback(lazy.update))
vim.keymap.set("n", "<leader>ps", vim.callback(lazy.sync))
vim.keymap.set("n", "<leader>px", vim.callback(lazy.clean))
vim.keymap.set("n", "<leader>pc", vim.callback(lazy.check))
vim.keymap.set("n", "<leader>pl", vim.callback(lazy.log))
vim.keymap.set("n", "<leader>pr", vim.callback(lazy.restore))
vim.keymap.set("n", "<leader>pp", vim.callback(lazy.profile))
vim.keymap.set("n", "<leader>pd", vim.callback(lazy.debug))
