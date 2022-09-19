local bufferline = require("bufferline")
local tree = require("nvim-tree")
local api = require("nvim-tree.api")
local telescope = require("telescope")
local themes = require("telescope.themes")
local builtin = require("telescope.builtin")

bufferline.setup({
  options = {
    persist_buffer_sort = false,
    show_close_icon = false,
    show_buffer_close_icons = false,
    modified_icon = _G.icons.ui.Modified,
    left_trunc_marker = _G.icons.ui.TruncLeft,
    right_trunc_marker = _G.icons.ui.TruncRight,
  },
})

vim.keymap.set("n", "<s-h>", vim.get_hof(bufferline.cycle, -1))
vim.keymap.set("n", "<s-l>", vim.get_hof(bufferline.cycle, 1))

tree.setup({
  hijack_cursor = true,
  remove_keymaps = true,
  on_attach = function(bufnr)
    vim.keymap.set("n", "h", vim.get_hof(api.node.navigate.parent_close), { buffer = bufnr })
    vim.keymap.set("n", "l", vim.get_hof(api.node.open.edit), { buffer = bufnr })
    vim.keymap.set("n", "q", vim.get_hof(api.tree.close), { buffer = bufnr })
    vim.keymap.set("n", "r", vim.get_hof(api.tree.reload), { buffer = bufnr })
    vim.keymap.set("n", "d", vim.get_hof(api.fs.cut), { buffer = bufnr })
    vim.keymap.set("n", "y", vim.get_hof(api.fs.copy.node), { buffer = bufnr })
    vim.keymap.set("n", "p", vim.get_hof(api.fs.paste), { buffer = bufnr })
    vim.keymap.set("n", "c", vim.get_hof(api.fs.rename), { buffer = bufnr })
    vim.keymap.set("n", "x", vim.get_hof(api.fs.remove), { buffer = bufnr })
    vim.keymap.set("n", "a", vim.get_hof(api.fs.create), { buffer = bufnr })
  end,
  git = {
    enable = true,
    ignore = false,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = _G.icons.diagnostic.Suggestion,
      info = _G.icons.diagnostic.Information,
      warning = _G.icons.diagnostic.Warning,
      error = _G.icons.diagnostic.Error,
    },
  },
  view = {
    hide_root_folder = true,
    float = {
      enable = true,
      open_win_config = {
        width = 40,
        height = 40,
        row = (vim.api.nvim_win_get_height(0) / 2) - 20,
      },
    },
  },
  renderer = {
    group_empty = true,
    symlink_destination = false,
    indent_markers = {
      enable = true,
    },
    icons = {
      git_placement = "after",
      glyphs = {
        default = _G.icons.document.File,
        symlink = _G.icons.document.Link,
        folder = {
          arrow_closed = _G.icons.ui.Collapsed,
          arrow_open = _G.icons.ui.Expanded,
          symlink = _G.icons.document.Link,
          default = _G.icons.document.Folder,
          open = _G.icons.document.Open,
          symlink_open = _G.icons.document.Open,
          empty = _G.icons.document.Empty,
          empty_open = _G.icons.document.EmptyOpen,
        },
        git = {
          untracked = _G.icons.git.Untracked,
          staged = _G.icons.git.Added,
          unstaged = _G.icons.git.Modified,
          renamed = _G.icons.git.Renamed,
          deleted = _G.icons.git.Deleted,
          unmerged = _G.icons.git.Unmerged,
          ignored = _G.icons.git.Ignored,
        },
      },
    },
  },
})

vim.keymap.set("n", "<c-/>", vim.get_hof(tree.toggle))

telescope.setup({
  defaults = themes.get_dropdown(),
})

vim.keymap.set("n", "<leader>fr", vim.get_hof(builtin.oldfiles))
vim.keymap.set("n", "<leader>ff", vim.get_hof(builtin.find_files))
vim.keymap.set("n", "<leader>fa", vim.get_hof(builtin.filetypes))
vim.keymap.set("n", "<leader>fw", vim.get_hof(builtin.live_grep))
vim.keymap.set("n", "<leader>fs", vim.get_hof(builtin.lsp_document_symbols))
