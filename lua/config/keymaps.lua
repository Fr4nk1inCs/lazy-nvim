-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

if vim.g.neovide then
    vim.keymap.set("n", "<C-s>", ":w<CR>") -- Save
    vim.keymap.set("v", "<C-c>", '"+y') -- Copy
    vim.keymap.set("n", "<C-v>", '"+P') -- Paste normal mode
    vim.keymap.set("v", "<C-v>", '"+P') -- Paste visual mode
    vim.keymap.set("c", "<C-v>", "<C-R>+") -- Paste command mode
    vim.keymap.set("i", "<C-v>", '<ESC>l"+Pli') -- Paste insert mode
end
