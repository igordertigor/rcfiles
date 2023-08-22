local M = {}

M.markdown = {
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
    -- ["<leader>N"] = {":Telescope find_files find_command=./new<CR><CR>", "new note", opts = {nowait = true}},
    ["<leader>N"] = {":e `./new`<CR>", "new note", opts = {nowait = true}}
  },
}

return M
