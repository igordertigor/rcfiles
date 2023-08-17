vim.opt.colorcolumn = "80"
vim.opt.tags = ".git/tags;$HOME"


local autocmd = vim.api.nvim_create_autocmd


autocmd("FileType", {
  callback = function()
    if vim.bo.ft == "markdown" then
      vim.keymap.set("i", "->", "→", {nowait = true})
      vim.keymap.set("i", "~>", "⇝", {nowait = true})
      vim.keymap.set("i", "=>", "⇒", {nowait = true})
      vim.keymap.set("i", "|>", "↦", {nowait = true})
      vim.keymap.set("i", "@o", "☐", {nowait = true})
      vim.keymap.set("i", "@v", "☑", {nowait = true})
      vim.keymap.set("i", "@x", "☒", {nowait = true})
    else
      vim.keymap.del("i", "->")
      vim.keymap.del("i", "~>")
      vim.keymap.del("i", "=>")
      vim.keymap.del("i", "|>")
      vim.keymap.del("i", "@o")
      vim.keymap.del("i", "@v")
      vim.keymap.del("i", "@x")
    end
  end
})
