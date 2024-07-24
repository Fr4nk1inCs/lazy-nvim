local vaults = {}
local system
if vim.fn.has("win32") == 1 then -- Windows
    system = "Windows"
    vaults["master-kb"] = "C:\\Users\\fushen\\OneDrive\\master-kb"
elseif vim.fn.has("mac") == 1 then
    system = "macOS"
    vaults["master-kb"] = "~/Library/CloudStorage/OneDrive/master-kb"
elseif vim.fn.has("wsl") == 1 then
    system = "WSL"
    vaults["master-kb"] = "/mnt/c/Users/fushen/OneDrive/master-kb"
else
    system = "Linux"
    vaults["master-kb"] = "~/OneDrive/master-kb"
end

local default_vault = "master-kb"

-- configurations for obsidian.nvim plugin
local trigger_events = {}
local workspaces = {}
for name, path in pairs(vaults) do
    table.insert(workspaces, { name = name, path = path })
    table.insert(trigger_events, "BufReadPre " .. vim.fn.expand(path) .. "/**.md")
    table.insert(trigger_events, "BufNewFile " .. vim.fn.expand(path) .. "/**.md")
end

-- create user command to open vaults
vim.api.nvim_create_user_command("Obsidian", function(opts)
    local name = opts.fargs[1]
    if name == nil then
        name = default_vault
        vim.notify("Using default vault " .. name, vim.log.levels.INFO)
    end

    local path = vaults[name]
    if vaults[name] == nil then
        vim.notify("Invalid vault name " .. name, vim.log.levels.ERROR)
        return
    end
    vim.notify("Opening vault " .. name .. " at " .. path, vim.log.levels.INFO)
    vim.fn.chdir(path)
    require("fzf-lua").oldfiles({
        cwd = path,
    })
end, {
    nargs = "?",
    complete = function(_, _, _)
        return vim.tbl_keys(vaults)
    end,
})

return {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    event = trigger_events,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
        "ibhagwan/fzf-lua",
        "nvim-treesitter/nvim-treesitter",
    },
    opts = {
        workspaces = workspaces,
        ui = { enable = false },
        ---@param title string|?
        ---@return string
        note_id_func = function(title)
            if title ~= nil then
                return title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
            else
                -- 4 random uppercase letters
                title = ""
                for _ = 1, 4 do
                    title = title .. string.char(math.random(65, 90))
                end
                return title
            end
        end,
        ---@param url string
        follow_url_func = function(url)
            -- Open the URL in the default web browser.
            if system == "Windows" then
                if url:find("?") then
                    url = string.format('`"%s`"', url)
                end
                vim.fn.jobstart({ "explorer.exe", url }, { detach = true })
            elseif system == "macOS" then
                vim.fn.jobstart({ "open", url }, { detach = true })
            elseif system == "Linux" then
                vim.fn.jobstart({ "xdg-open", url }, { detach = true })
            elseif system == "WSL" then
                vim.fn.jobstart(
                    { "/mnt/c/Windows/System32/rundll32.exe", "url.dll,FileProtocolHandler", url },
                    { detach = true }
                )
            end
        end,
    },
}
