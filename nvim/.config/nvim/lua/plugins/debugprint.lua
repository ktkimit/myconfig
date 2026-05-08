return {
    "andrewferrier/debugprint.nvim",

    opts = {
        filetypes = {
            ["cpp"] = {
                left = 'std::cout << "',
                right = '" << std::endl;',
                mid_var = '" << ',
                right_var = " << std::endl;",
            },
        },
    },

    dependencies = {
        "ibhagwan/fzf-lua",
    },

    version = "*",
}
