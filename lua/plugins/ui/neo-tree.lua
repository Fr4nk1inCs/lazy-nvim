return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    opts = {
        default_source = "last",
        popup_border_style = "rounded",
        default_component_configs = {
            icon = {
                folder_closed = "",
                folder_open = "",
                folder_empty = "",
            },
        },
        source_selector = {
            winbar = true,
            sources = {
                {
                    source = "filesystem",
                    display_name = "  Files ",
                },
                {
                    source = "buffers",
                    display_name = "  Buffers ",
                },
                {
                    source = "git_status",
                    display_name = "  Git ",
                },
                {
                    source = "document_symbols",
                    display_name = " Symbols",
                },
            },
            highlight_tab = "BufferLineBuffer",
            highlight_tab_active = "BufferLineBufferSelected",
            highlight_background = "BufferLineBuffer",
            highlight_separator = "BufferLineSeparator",
            highlight_separator_active = "BufferLineSeparatorSelected",
        },
        filesystem = {
            filtered_items = {
                hide_dotfiles = false,
            },
            group_empty_dirs = true,
            follow_current_file = {
                enabled = true,
            },
        },
    },
    keys = {
        { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "File Explorer" },
    },
}
