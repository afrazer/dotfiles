return {
    {
        "nvim-telescope/telescope.nvim",
        version = "*",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local actions = require("telescope.actions")
            require("telescope").setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<C-h>"] = "which_key",
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                        },
                    },
                    sorting_strategy = "ascending",
                    layout_strategy = "vertical",
                    layout_config = {
                        prompt_position = "top",
                        vertical = {
                            width = 0.9,
                        },
                    },
                },
            })

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<C-p>", builtin.find_files, {})
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>ft", builtin.grep_string, {})
        end,
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install",
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
}
