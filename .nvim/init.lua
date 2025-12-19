-- Leader MUST be first
vim.g.mapleader = "l"
vim.g.maplocalleader = "l"

-- disable netrw at the very beginning of init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Disable Copilot tab mapping to avoid conflicts
vim.g.copilot_no_tab_map = true

require("config.autocmds")
require("config.keymaps")
require("config.lazy")
