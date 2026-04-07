local vim = vim
local Plug = vim.fn['plug#']

-- Ajout du path nvim a package.path pour que sa configuration soit chargée peut importe depuis ou on l'utilise
local config_path = vim.fn.stdpath("config")  -- chemin absolu de ~/.config/nvim
package.path = config_path .. "/?.lua;" .. package.path


vim.g.mapleader = " "

vim.call('plug#begin', vim.fn.stdpath('data') .. '/plugged')

-- Installation des plugins
Plug('catppuccin/nvim')
Plug('nvim-tree/nvim-tree.lua')
Plug('nvim-tree/nvim-web-devicons')
Plug('romgrk/barbar.nvim')
Plug('nvim-lualine/lualine.nvim')
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

-- cœur du debug
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-dap-python'

vim.call('plug#end')

-- Chargement des plugins
require"theme"
require"lua_line"
require"vimtree"
require"barbar"
require"treesitter"
require("dap-python").setup("~/Projets/odoo17/noemis/.venv/bin/python3")

-- Une fois les plugins chargés on peut définir les raccourcos claviers et autres env
require"common"
