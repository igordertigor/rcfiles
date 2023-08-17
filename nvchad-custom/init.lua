vim.opt.colorcolumn = "80"
vim.opt.tags = ".git/tags;$HOME"


local autocmd = vim.api.nvim_create_autocmd


autocmd("FileType", {
  callback = function()
    if vim.bo.ft == "markdown" then
      vim.keymap.set("i", "->", "→", {nowait = true, buffer=true})
      vim.keymap.set("i", "~>", "⇝", {nowait = true, buffer=true})
      vim.keymap.set("i", "=>", "⇒", {nowait = true, buffer=true})
      vim.keymap.set("i", "|>", "↦", {nowait = true, buffer=true})
      vim.keymap.set("i", "@o", "☐", {nowait = true, buffer=true})
      vim.keymap.set("i", "@v", "☑", {nowait = true, buffer=true})
      vim.keymap.set("i", "@x", "☒", {nowait = true, buffer=true})
    end
  end
})
