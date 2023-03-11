return {
    {
        "CRAG666/code_runner.nvim",
        keys = {
            {
                "<leader>rc",
                ":RunCode<CR>",
                desc = "Run file or project",
            },
            {
                "<leader>rf",
                ":RunFile<CR>",
                desc = "Run file",
            },
        },
        opts = {
            -- put here the commands by filetype
            filetype = {
                python = "python3 -u",
                c = "cd '$dir' && clang -O2 -Wall -o '$fileNameWithoutExt' '$fileName' && '$dir/$fileNameWithoutExt'",
                cpp = "cd '$dir' && clang++ -O2 -Wall -o '$fileNameWithoutExt' '$fileName' && '$dir/$fileNameWithoutExt'",
                sh = "$dir/$fileName",
                bash = "bash $dir/$fileName",
                zsh = "zsh $dir/$fileName",
                rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
            },
            startinsert = true,
            mode = "float",
            float = {
                border = "rounded",
            },
        },
    },
}
