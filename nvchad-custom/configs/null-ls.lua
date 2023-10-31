local null_ls = require('null-ls')
local opts = {
  sources = {
    -- Python
    null_ls.builtins.formatting.blue,
    null_ls.builtins.diagnostics.mypy.with(
      {
        prefer_local = ".venv/bin/mypy"
      }
    ),
    null_ls.builtins.diagnostics.ruff,

    -- Lua
    null_ls.builtins.formatting.stylua,

    -- webdev
    null_ls.builtins.formatting.deno_fmt,
    null_ls.builtins.formatting.prettier.with { filetypes = {"html", "markdown", "css"}}
  }
}
return opts
