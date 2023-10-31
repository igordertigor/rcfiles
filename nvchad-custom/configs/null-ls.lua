local null_ls = require('null-ls')
local opts = {
  -- debug = true,
  sources = {
    -- Python
    null_ls.builtins.formatting.blue,
    null_ls.builtins.diagnostics.mypy.with(
      {
        command = ".venv/bin/mypy"  -- Note: mason prepends it's path! Maybe remove mypy from the mason config?
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
