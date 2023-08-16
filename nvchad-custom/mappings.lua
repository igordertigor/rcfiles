local M = {}

M.abc = {
  n = {
    ["@v"] = {
      function ()
        vim.cmd(":s/☐/☑/")
        vim.cmd(":nohl")
      end,
      "check"
    },
    ["@x"] = {
      function ()
        vim.cmd(":s/☐/☒/")
        vim.cmd(":nohl")
      end,
      "cross"
    },
    ["<leader>N"] = {":Telescope find_files find_command=./new<CR><CR>", "new note", opts = {nowait = true}},
  },
  i = {
    ["@|>"] = {"↦", "maps to arrow", opts = {nowait = true}},
    ["@->"] = {"→", "right arrow", opts = {nowait = true}},
    ["@~>"] = {"⇝", "leads to arrow", opts = {nowait = true}},
    ["@=>"] = {"⇒", "implies arrow", opts = {nowait = true}},
    ["@o"] = {"☐", "checkbox empty", opts = {nowait = true}},
    ["@v"] = {"☑", "checkbox checked", opts = {nowait = true}},
    ["@x"] = {"☒", "checkbox crossed", opts = {nowait = true}},
  },
}

return M
