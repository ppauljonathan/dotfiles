-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

-- make space as the leader key
vim.g.mapleader = " "

-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows (delta: 2 lines)
vim.keymap.set('n', '<M-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<M-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<M-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<M-Right>', ':vertical resize +2<CR>', opts)

-- NeoTree Open
vim.keymap.set('n', '<C-b>', ':Neotree reveal_force_cwd toggle right<CR>', opts)

-- Buffers
vim.keymap.set('n', '<leader>bs', ':w<CR>', opts) -- Save buffer
vim.keymap.set('n', '<leader>bk', ':bd<CR>', opts) -- Close buffer

-- Tabs
-- vim.keymap.set('n', '<leader><Tab>', ':bnext<CR>', opts)

-- Splits
vim.keymap.set("n", "<leader>ws", ":split<CR>", { desc = "Horizontal Split" })
vim.keymap.set("n", "<leader>wv", ":vsplit<CR>", { desc = "Vertical Split" })
vim.keymap.set("n", "<leader>ww", "<C-w>w", { desc = "Switch Split" })
vim.keymap.set("n", "<leader>wc", ":close<CR>", { desc = "Close Split" })

vim.keymap.set("n", "<M-Right>", "w", opts)  -- Option + Right: Move forward by word
vim.keymap.set("n", "<M-Left>", "b", opts)   -- Option + Left: Move backward by word
vim.keymap.set("n", "<D-Right>", "$", opts)  -- Command + Right: Move to end of line
vim.keymap.set("n", "<D-Left>", "0", opts)   -- Command + Left: Move to beginning of line
vim.keymap.set("n", "<D-Up>", "gg", opts)    -- Command + Up: Move to beginning of file
vim.keymap.set("n", "<D-Down>", "G", opts)   -- Command + Down: Move to end of file

-- quickfix
vim.keymap.set("n", "<D-j>", ":cn<CR>", opts)
vim.keymap.set("n", "<D-k>", ":cp<CR>", opts)

-----------------
-- Visual mode --
-----------------

-- Keep selection when indenting
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)



vim.keymap.set("v", "<M-Right>", "w", opts)  -- Option + Right: Move forward by word
vim.keymap.set("v", "<M-Left>", "b", opts)   -- Option + Left: Move backward by word
vim.keymap.set("v", "<D-Right>", "$", opts)  -- Command + Right: Move to end of line
vim.keymap.set("v", "<D-Left>", "0", opts)   -- Command + Left: Move to beginning of line
vim.keymap.set("v", "<D-Up>", "gg", opts)    -- Command + Up: Move to beginning of file
vim.keymap.set("v", "<D-Down>", "G", opts)   -- Command + Down: Move to end of file

-----------------
-- Insert mode --
-----------------

vim.keymap.set("i", "<M-Right>", "<C-o>w", opts)  -- Option + Right: Move forward by word
vim.keymap.set("i", "<M-Left>", "<C-o>b", opts)   -- Option + Left: Move backward by word
vim.keymap.set("i", "<D-Right>", "<C-o>$", opts)  -- Command + Right: Move to end of line
vim.keymap.set("i", "<D-Left>", "<C-o>0", opts)   -- Command + Left: Move to beginning of line
vim.keymap.set("i", "<D-Up>", "<C-o>gg", opts)   -- Command + Up: Move to the beginning of the file
vim.keymap.set("i", "<D-Down>", "<C-o>G", opts)  -- Command + Down: Move to the end of the file
