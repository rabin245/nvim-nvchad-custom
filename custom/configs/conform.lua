--type conform.options
local options = {
  lsp_fallback = true,
  formatters_by_ft = {
    lua = { "stylua" },

    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    typescript = { "prettier" },
    javascript = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },

    python = { "black" },
  },
  format_on_save = {
    timeout_ms = 5000,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
