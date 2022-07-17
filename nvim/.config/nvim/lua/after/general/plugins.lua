local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) == 1 then
  vim.fn.system({ "git", "clone", "--depth=1", "https://github.com/wbthomason/packer.nvim.git", install_path })
end

vim.g.plugins = {
  "wbthomason/packer.nvim",

  "kyazdani42/nvim-web-devicons",
  "navarasu/onedark.nvim",

  "nvim-lua/plenary.nvim",
  "nvim-lua/popup.nvim",
  "rcarriga/nvim-notify",
  "stevearc/dressing.nvim",
  "windwp/nvim-autopairs",
  "numtostr/comment.nvim",
  "numtostr/fterm.nvim",

  "ahmedkhalf/project.nvim",
  "lewis6991/gitsigns.nvim",
  "akinsho/git-conflict.nvim",

  "toppair/reach.nvim",
  "kyazdani42/nvim-tree.lua",
  "nvim-telescope/telescope.nvim",

  "utilyre/barbecue.nvim",
  "nvim-lualine/lualine.nvim",

  "nvim-treesitter/nvim-treesitter",
  "p00f/nvim-ts-rainbow",
  "lukas-reineke/indent-blankline.nvim",

  "l3mon4d3/luasnip",
  "utilyre/spoon.nvim",

  "neovim/nvim-lspconfig",
  "williamboman/nvim-lsp-installer",
  "jose-elias-alvarez/null-ls.nvim",
  "smiteshp/nvim-navic",

  "hrsh7th/nvim-cmp",
  "saadparwaiz1/cmp_luasnip",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
}
