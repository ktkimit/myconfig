local M = {
  'Bekaboo/dropbar.nvim',
  -- optional, but required for fuzzy finder support
  dependencies = {
    'nvim-telescope/telescope-fzf-native.nvim'
  }
}

function M.config()
  local dropbar = require("dropbar")
  dropbar.setup({
    menu = {
      keymaps = {
        ['<S-Tab>'] = function()
          local utils = require('dropbar.utils')
          local menu = utils.menu.get_current()
          if not menu then
            return
          end
          if menu.prev_menu then
            menu:close()
          else
            local bar = require('dropbar.utils.bar').get({ win = menu.prev_win })
            local barComponents = bar.components[1]._.bar.components
            for _, component in ipairs(barComponents) do
              if component.menu then
                local idx = component._.bar_idx
                menu:close()
                require('dropbar.api').pick(idx - 1)
              end
            end
          end
        end,
        ['<Tab>'] = function()
          local utils = require('dropbar.utils')
          local menu = utils.menu.get_current()
          if not menu then
            return
          end
          local cursor = vim.api.nvim_win_get_cursor(menu.win)
          local component = menu.entries[cursor[1]]:first_clickable(cursor[2])
          if component then
            menu:click_on(component, nil, 1, 'l')
          end
        end,
      }
    }
  })

  local dropbar_menu = require("dropbar.utils.menu")
  vim.ui.select = dropbar_menu.select

  vim.keymap.set("n", "<space>b", function()
    require("dropbar.api").pick(vim.v.count ~= 0 and vim.v.count)
  end)
end

return M
