local M = {}

M.abc = {
  i = {
    ["@|>"] = {"↦", "maps to arrow", opts = {nowait = true}},
    ["@->"] = {"→", "right arrow", opts = {nowait = true}},
    ["@~>"] = {"⇝", "leads to arrow", opts = {nowait = true}},
    ["@=>"] = {"⇒", "implies arrow", opts = {nowait = true}},
    ["@o"] = {"☐", "checkbox empty", opts = {nowait = true}},
    ["@v"] = {"☑", "checkbox checked", opts = {nowait = true}},
    ["@x"] = {"☒", "checkbox crossed", opts = {nowait = true}},
  },
  n = {
    ["<leader>N"] = {":Telescope find_files find_command=./new<CR><CR>", "new note", opts = {nowait = true}}
  }
}

return M
