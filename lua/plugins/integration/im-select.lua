local default_command, default_im_select

if vim.fn.has("wsl") then
    local data_dir = vim.fn.stdpath("data")
    assert(type(data_dir) == "string" and data_dir ~= "", "Invalid data directory")
    local exe_dir = vim.fs.joinpath(data_dir, "im-select")
    -- get the executable from github
    local exe_path = vim.fs.joinpath(exe_dir, "im-select-mspy.exe")
    local url = "https://raw.githubusercontent.com/daipeihust/im-select/master/win-mspy/out/x64/im-select-mspy.exe"
    vim.fn.mkdir(exe_dir, "p")
    if vim.fn.filereadable(exe_path) == 0 then
        print(1)
        vim.notify("Downloading im-select-mspy.exe", "info", { title = "im-select.nvim" })
        vim.fn.system(string.format("curl -L %s -o %s", url, exe_path))
        vim.fn.system(string.format("chmod +x %s", exe_path))
        vim.notify("Downloaded im-select-mspy.exe", "info", { title = "im-select.nvim" })
    end
    default_command = exe_path
    default_im_select = "英语模式" -- English US Keyboard
elseif vim.fn.has("mac") then
    default_command = "im-select"
    default_im_select = "com.apple.keylayout.US"
else
    default_command = "fcitx5-remote"
    default_im_select = "keyboard-us"
end

return {
    {
        "keaising/im-select.nvim",
        event = "VeryLazy",
        opts = {
            default_command = default_command,
            default_im_select = default_im_select,
        },
    },
}
