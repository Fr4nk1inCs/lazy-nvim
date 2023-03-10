-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.smarttab = true
opt.shiftwidth = 4
opt.tabstop = 4

opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.colorcolumn = { "80", "120" }
opt.whichwrap = "<,>,h,l,[,]"

opt.fileencodings = { "ucs-bom", "utf-8", "GB18030", "gbk" }

opt.laststatus = 3
opt.pumblend = 0

vim.diagnostic.config({
    float = { border = "rounded" },
})
