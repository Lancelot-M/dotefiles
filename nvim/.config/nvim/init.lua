local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin', vim.fn.stdpath('data') .. '/plugged')

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

home = os.getenv("HOME")
package.path = home .. "/.config/nvim/?.lua;" .. package.path

require"common"
require"theme"
require"lua_line"
require"vimtree"
require"treesitter"

require("dap-python").setup("~/Projets/odoo17/noemis/.venv/bin/python3")
