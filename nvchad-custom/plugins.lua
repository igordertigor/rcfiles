local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Python
        "jedi-language-server",
        "mypy",
        "ruff",
        "blue",

        -- lua stuff
        "lua-language-server",
        "stylua",

        -- bash
        "bash-language-server",

        -- web dev stuff
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "deno",
        "prettier",

        -- text
        "ltex-ls",
      }
    }
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python"},
    opts = function ()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "markdown",
        "markdown_inline",
        "python",
      },
      indent = {
        enable = true,
      }
    }
  }
}

return plugins
