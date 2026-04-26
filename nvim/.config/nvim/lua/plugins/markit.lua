return {
    '2kabhishek/markit.nvim',
    dependencies = {
        {
            '2kabhishek/pickme.nvim',
            opts = {
                picker = 'fzf-lua',
            },
        },
        'nvim-lua/plenary.nvim',
    },
    opts = {},
    event = { 'BufReadPre', 'BufNewFile' },
}
