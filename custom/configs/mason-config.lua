return function()
  -- import mason
  local mason = require("mason")

  -- import mason-lspconfig
  local mason_lspconfig = require("mason-lspconfig")

  local mason_tool_installer = require("mason-tool-installer")

  mason.setup()

  mason_lspconfig.setup({
    -- list of servers for mason to install
    -- uses lspconfig's naming conventions
    ensure_installed = {
      "tsserver",
      "html",
      "cssls",
      "tailwindcss",
      "lua_ls",
      -- "emmet_ls",
      "pyright",
      "clangd",
      "jsonls"
    },
    -- auto-install configured servers (with lspconfig)
    automatic_installation = true, -- not the same as ensure_installed
  })

  mason_tool_installer.setup({
    ensure_installed = {
      "prettier", -- prettier formatter
      "stylua",   -- lua formatter
      "isort",    -- python formatter
      "black",    -- python formatter
      "pylint",   -- python linter
      "eslint_d", -- js linter
    },
  })
end
