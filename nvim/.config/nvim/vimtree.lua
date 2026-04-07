local nvim_tree = require("nvim-tree")

-- fonction on_attach pour raccourcis spécifiques à NvimTree
local function my_on_attach(bufnr)
  local api = require("nvim-tree.api")
  api.config.mappings.default_on_attach(bufnr)

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true }
  end

  -- raccourcis dans le buffer NvimTree
  vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
  vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))
end

-- setup NvimTree
nvim_tree.setup({
  on_attach = my_on_attach,
})

-- raccourcis globaux (accessible depuis n’importe quel buffer)
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
