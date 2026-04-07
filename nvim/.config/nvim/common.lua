-- Fichier de configuration de vim et des raccourcis claviers

-- Sert à accéder ou définir des **options spécifiques à une fenêtre** (window-local).
vim.wo.number = true

--  Sert à accéder ou définir des **variables globales**.
vim.g.mouse = 'a'
vim.g.maplocalleader = " "  -- pour les mappings locauox
vim.g.mapleader = " "

-- Sert à manipuler des **options globales ou locales**, de façon plus flexible.
vim.opt.encoding="utf-8"
vim.opt.swapfile = false
vim.opt.scrolloff = 7
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.fileformat = "unix"

-- Raccourcis liés à barbar
vim.keymap.set('n', '<Tab>', '<Cmd>BufferNext<CR>', { noremap = true, silent = true })
