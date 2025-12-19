local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- BufExplorer
keymap("n", "ls", ":BufExplorer<CR>", opts)

-- Vim Board
keymap("n", "ln", "<Plug>(BoardMenu)", { silent = true })

-- Move lines around
keymap("n", "<C-j>", ":m .+1<CR>==", opts)
keymap("n", "<C-k>", ":m .-2<CR>==", opts)
keymap("i", "<C-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("i", "<C-k>", "<Esc>:m .-2<CR>==gi", opts)
keymap("v", "<C-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<C-k>", ":m '<-2<CR>gv=gv", opts)

-- Buffers
keymap("n", "<C-w><Tab>", ":bnext<CR>:redraw<CR>:ls<CR>", opts)
keymap("n", "<C-p>", ":Telescope find_files<CR>", opts)
keymap("n", "<C-g>", ":Telescope live_grep<CR>", opts)

-- Copilot
keymap("n", "<Leader>c", ":CopilotChatOpen<CR>", opts)
keymap("v", "<Leader>a", "<Plug>CopilotChatAddSelection", {})

-- Livedown MD Preview
keymap("n", "nm", ":LivedownToggle<CR>", opts)

-- Neotree
keymap("n", "<Tab>", ":Neotree toggle<CR>:tabn<CR>:redraw<CR>", opts)

-- Aerial
keymap("n", "<S-Tab>", "<cmd>AerialToggle!<CR>", opts)

-- Mouse
keymap({ "n", "v", "i" }, "<ScrollWheelUp>", "k", { silent = true })
keymap({ "n", "v", "i" }, "<ScrollWheelDown>", "j", { silent = true })

-- Jump back after jumping in (Standard Neovim, works with LSP)
keymap('n', '<C-t>', '<C-o>', { desc = 'Jump Back' })

-- Git
keymap("n", "gh", ":0Gclog<CR>", opts)
keymap("n", "gj", ":Gdiffsplit<CR>", opts)

-- Send to jira
keymap("x", "jr", "<esc>:!rm /tmp/jira <esc>:'<,'>w /tmp/jira <esc>:!create_jira /tmp/jira<CR>", {})

-- Sideways
keymap("n", "l", ":SidewaysLeft<CR>", opts)
keymap("n", "m", ":SidewaysRight<CR>", opts)

-- Copilot
keymap('i', '<S-Tab>', 'copilot#Accept("\\<S-Tab>")', { expr = true, replace_keycodes = false })
