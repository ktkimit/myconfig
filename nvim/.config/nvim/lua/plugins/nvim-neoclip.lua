return {
  "AckslD/nvim-neoclip.lua",
  dependencies = {
    { 'ibhagwan/fzf-lua' },
  },
  event = "VeryLazy",
  opts = {
    keys = {
      fzf = {
        custom = {
          ['ctrl-d'] = function(action_opts)
            local storage = require('neoclip.storage')
            if not action_opts or not action_opts.entry
                or not action_opts.entry.contents then
              return
            end
            pcall(storage.delete, 'yanks', action_opts.entry)
            if #storage.get().yanks == 0 then return end
            vim.schedule(function()
              require('neoclip.fzf')(action_opts.register_names)
            end)
          end,
        },
      },
    },
  },
  keys = {
    {
      "<space>y",
      function()
        if #require('neoclip.storage').get().yanks == 0 then
          vim.notify('Neoclip: yank history is empty', vim.log.levels.INFO)
          return
        end
        require('neoclip.fzf')()
      end,
      desc = "Neoclip (default register)",
    },
    {
      "<space>Y",
      function()
        vim.api.nvim_echo({ { 'Register: ', 'Question' } }, false, {})
        local ok, ch = pcall(vim.fn.getcharstr)
        vim.api.nvim_echo({ { '' } }, false, {})
        if not ok or ch == '' or ch == '\27' then return end -- abort on <Esc>
        if #require('neoclip.storage').get().yanks == 0 then
          vim.notify('Neoclip: yank history is empty', vim.log.levels.INFO)
          return
        end
        require('neoclip.fzf')(ch)
      end,
      desc = "Neoclip (prompt for register)",
    },
  },
}
