local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "tailwindcss" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- custom rust lsp configuration
lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  imports = {
    granularity = {
      group = "module",
    },
    prefix = "self",
  },
  cargo = {
    buildScripts = {
      enable = true,
    },
  },
  procMacro = {
    enable = true,
  },
}
