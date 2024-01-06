-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Disable arrow keys
local function notify()
    return vim.notify("Arrow keys are disabled, use hjkl instead", vim.log.levels.WARN)
end
local arrow_keys = { "<up>", "<down>", "<left>", "<right>" }
local modes_disabling_arrow_keys = { "n", "i", "v", "t", "c" }
for _, mode in ipairs(modes_disabling_arrow_keys) do
    for _, key in ipairs(arrow_keys) do
        vim.keymap.set(mode, key, notify, { silent = true })
    end
end

if vim.g.neovide then
    vim.keymap.set("n", "<C-s>", ":w<CR>") -- Save
    vim.keymap.set("v", "<C-c>", '"+y') -- Copy
    vim.keymap.set("v", "<C-v>", '"+P') -- Paste visual mode
    vim.keymap.set("c", "<C-v>", "<C-R>+") -- Paste command mode
    vim.keymap.set("i", "<C-v>", '<ESC>"+pa') -- Paste insert mode
end

-- Delete unnecessary keymaps
local function safe_delete_keymap(mode, keybind)
    if vim.fn.mapcheck(keybind, mode) == false then
        vim.keymap.del(mode, keybind)
    end
end
safe_delete_keymap("n", "<leader>ft")
safe_delete_keymap("n", "<leader>fT")
safe_delete_keymap("n", "<c-/>")
safe_delete_keymap("t", "<c-/>")
safe_delete_keymap("n", "<c-_>")
