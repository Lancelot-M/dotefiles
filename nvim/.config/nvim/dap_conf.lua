-- nvim-dap + Odoo17 debug config

local dap = require('dap')
local dapui = require("dapui")
dapui.setup()

-- Adapter Python (debugpy)
dap.adapters.python = {
  type = 'executable',
  command = 'python3',  -- ton python / venv
  args = { '-m', 'debugpy.adapter' },
}

-- Setup DAP UI
dapui.setup({
  icons = { expanded = "▾", collapsed = "▸" },
  layouts = {
    {
      elements = {
        "scopes",
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40, -- largeur
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 10,
      position = "bottom",
    },
  },
})

-- Configuration pour lancer Odoo17 localement
dap.configurations.python = {
  {
    type = 'python',          -- doit correspondre à dap.adapters.python
    request = 'launch',       -- "launch" pour démarrer le serveur
    name = "Debug Odoo17 Local",
    program = "~/Projets/odoo17/standard_17_readonly/setup/odoo",   -- ton binaire Odoo
    args = {
      "-c", "~/Projets/odoo17/noemis/odoo.conf",        -- fichier config
      "--dev", "all",                         -- mode dev
      "--addons-path", "/chemin/vers/addons"  -- facultatif
    },
    pythonPath = function()
      return "~/Projets/odoo17/noemis/.venv/bin/python3"   -- Python du venv si utilisé
    end,
  },
}

-- Ouvrir/fermer automatiquement l'UI avec le debug
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Raccourcis utiles
local map = vim.api.nvim_set_keymap
local opts = { noremap=true, silent=true }

map('n', '<F5>', "<cmd>lua require'dap'.continue()<CR>", opts)
map('n', '<F10>', "<cmd>lua require'dap'.step_over()<CR>", opts)
map('n', '<F11>', "<cmd>lua require'dap'.step_into()<CR>", opts)
map('n', '<F12>', "<cmd>lua require'dap'.step_out()<CR>", opts)
map('n', '<Leader>b', "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
map('n', '<Leader>B', "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Condition: '))<CR>", opts)
map('n', '<Leader>dr', "<cmd>lua require'dap'.repl.open()<CR>", opts)
map('n', '<Leader>dl', "<cmd>lua require'dap'.run_last()<CR>", opts)
