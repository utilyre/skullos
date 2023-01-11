local spec = {
  "folke/todo-comments.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
}

function spec.config()
  local todo = require("todo-comments")
  local telescope = require("telescope")

  todo.setup({
    colors = {
      hint = { "TodoCommentsNote" },
      info = { "TodoCommentsTodo" },
      warning = { "TodoCommentsWarn" },
      error = { "TodoCommentsBug" },
      test = { "TodoCommentsTest" },
      default = { "TodoCommentsPerf" },
    },
    keywords = {
      NOTE = {
        icon = vim.g.icons.widget.inline.Info,
      },
      TODO = {
        icon = vim.g.icons.widget.inline.Clipboard,
      },
      HACK = {
        icon = vim.g.icons.widget.inline.Fire,
      },
      WARN = {
        icon = vim.g.icons.widget.inline.Warn,
      },
      FIX = {
        icon = vim.g.icons.widget.inline.Error,
      },
      TEST = {
        icon = vim.g.icons.widget.inline.Filter,
      },
      PERF = {
        icon = vim.g.icons.widget.inline.Hourglass,
      },
    },
  })

  local function map(left, right)
    vim.keymap.set("n", "<leader>t" .. left, right)
  end

  map("k", vim.callback(todo.jump_prev))
  map("j", vim.callback(todo.jump_next))
  map("f", vim.callback(telescope.extensions["todo-comments"].todo))
end

return spec
