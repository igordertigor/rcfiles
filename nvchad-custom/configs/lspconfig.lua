local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")

local servers = {"html", "cssls", "tsserver", "bashls"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.jedi_language_server.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
}

lspconfig.ltex.setup{
  settings ={
    ltex={
      language = "en-US",
    },
  },
  on_attach = on_attach,
}

lspconfig.yamlls.setup{
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        ["https://raw.githubusercontent.com/iterative/dvcyaml-schema/master/schema.json"] = "/dvc.yaml",
      }
    }
  }
}
