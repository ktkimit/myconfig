return {
  "AckslD/nvim-neoclip.lua",
  dependencies = {
    { 'ibhagwan/fzf-lua' },
  },
  opts = {},
  keys = {
    {
      "<space>y",
      function() require('neoclip.fzf')() end,
      desc = "Neoclip (default register)",
    },
    {
      "<space>Y",
      function()
        vim.api.nvim_echo({ { 'Register: ', 'Question' } }, false, {})
        local ok, ch = pcall(vim.fn.getcharstr)
        vim.api.nvim_echo({ { '' } }, false, {})
        if not ok or ch == '' or ch == '\27' then return end -- abort on <Esc>
        require('neoclip.fzf')(ch)
      end,
      desc = "Neoclip (prompt for register)",
    },
  },
}
