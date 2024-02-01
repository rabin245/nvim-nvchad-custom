local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",

    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = require "custom.configs.mason-config", -- named it mason-config.lua coz mason.lua was being imported in plugins
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      -- "nvim-treesitter/nvim-treesitter-textobjects", -- causing issues with saving file, requires w! to save
      "windwp/nvim-ts-autotag",
    },
    opts = overrides.treesitter,
  },

  -- this breaks for javascript for now, will check later to see if it is fixed
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = true,
    config = require "custom.configs.nvim-treesitter-text-objects",
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }

  -- copilot setup
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    cmd = "Copilot",
    opts = overrides.copilot,
  },

  -- conform for formatting
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require "custom.configs.conform"
    end,
  },

  -- nvim-lint for linting
  {
    "mfussenegger/nvim-lint",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    config = require "custom.configs.nvim-lint",
  },

  -- dressing for inputs (renames, etc) and selections
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },

  -- nvim-surround for surrounding words with characters
  {
    "kylechui/nvim-surround",
    event = { "BufReadPre", "BufNewFile" },
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  -- extending comments to support tsx and jsx
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      -- import comment plugin safely
      local comment = require "Comment"

      local ts_context_commentstring = require "ts_context_commentstring.integrations.comment_nvim"

      -- enable comment
      comment.setup {
        -- for commenting tsx and jsx files
        pre_hook = ts_context_commentstring.create_pre_hook(),
      }
    end,
  },

  -- better code folding with nvim-ufo
  {
    "kevinhwang91/nvim-ufo",
    event = "VimEnter",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    config = function()
      vim.opt.foldlevel = 99
      vim.opt.foldlevelstart = 99
    end,
  },
}

return plugins
