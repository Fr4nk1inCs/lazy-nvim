-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.smarttab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.expandtab = true

opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.colorcolumn = { "80", "120" }
opt.whichwrap = "<,>,h,l,[,]"

opt.fileencodings = { "ucs-bom", "utf-8", "GB18030", "gbk" }

opt.laststatus = 3
opt.pumblend = 0

if vim.fn.has("wsl") == 1 then
    vim.g.clipboard = {
        name = "WslClipboard",
        copy = {
            ["+"] = "/mnt/c/Windows/System32/clip.exe",
            ["*"] = "/mnt/c/Windows/System32/clip.exe",
        },
        paste = {
            ["+"] = '/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            ["*"] = '/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        },
        cache_enabled = 0,
    }
end

vim.diagnostic.config({
    float = { border = "rounded" },
})

vim.api.nvim_set_hl(0, "TreesitterContextBottom", { bg = "#2e3440", underline = true })

-- Neovide configurations
if vim.g.neovide then
    vim.o.guifont = "Maple Mono SC NF:h12"
    vim.g.neovide_transparency = 0.9
    -- Wait for neovide to support this
    -- local alpha = function(rgb, transparency)
    --     return rgb .. string.format("%02x", transparency * 255)
    -- end
    -- vim.g.transparency = 0.8
    -- vim.g.neovide_background_color = alpha("#2e3440", 0.8)
    vim.g.neovide_floating_blur_amount_x = 5.0
    vim.g.neovide_floating_blur_amount_y = 5.0
    vim.g.neovide_floating_shadow = true
    vim.g.neovide_floating_z_height = 10
    vim.g.neovide_light_angle_degrees = 45
    vim.g.neovide_light_radius = 5
    vim.g.neovide_scroll_animation_length = 0.3
end
