local M = {}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

-- for copilot
M.copilot = {
  suggestion = {
    auto_trigger = true,
  },
  panel = {
    enabled = false,
  },
}

-- for nvim-treesitter
M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "python",
    "json",
    "dart",
    "gitignore",
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  -- auto_install = true,

  -- enable incremental selections
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-space>",
      node_incremental = "<C-space>",
      scope_incremental = false,
      node_decremental = "<bs>",
    },
  },

  -- enable autotagging (w/ nvim-ts-autotag plugin)
  autotag = {
    enable = true,
    enable_rename = true,
    enable_close = true,
    enable_close_on_slash = true,
  },
}

return M
