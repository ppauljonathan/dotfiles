require('options')
require('keymaps')
require('plugins')
require('colorscheme')
require('lsp')
require('cmp_config')

-- Neovide settings
if vim.g.neovide then
    vim.keymap.set({ "n", "v" }, "<D-=>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
    vim.keymap.set({ "n", "v" }, "<D-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
    vim.keymap.set({ "n", "v" }, "<D-0>", ":lua vim.g.neovide_scale_factor = 1<CR>")
end
