local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
  "tsserver",
  "html",
  "cssls",
  "tailwindcss",
  "lua_ls",
  -- "emmet_ls",
  "prismals",
  "pyright",
  "clangd",
  "jsonls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

--
-- lspconfig.pyright.setup { blabla}

-- might delete later if its annoying
-- lspconfig.emmet_ls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }

-- nvim-ufo
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

-- might need to move .setup to its own config later if more config required
require("ufo").setup()
