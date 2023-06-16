local M = {
  "akinsho/bufferline.nvim",
  event = { "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
  dependencies = {
    {
      "famiu/bufdelete.nvim",
    },
  },
}

function M.config()
  require("bufferline").setup{
    options = {
      mode = "buffers",
      numbers = "none",
      close_command = "bdelete! %d",
      right_mouse_command = "bdelete! %d",
      left_mouse_command = "buffer %d",
      middle_mouse_command = nil,
      indicator = {
        icon = '▎',
        style = 'icon',
      },
      buffer_close_icon = '󰅖',
      modified_icon = '●',
      close_icon = '',
      left_trunc_marker = '',
      right_trunc_marker = '',
      max_name_length = 18,
      max_prefix_length = 15,
      tab_size = 18,
      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = false,
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        return "("..count..")"
      end,
      custom_filter = function(buf_number, buf_numbers)
        if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
          return true
        end
        if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
          return true
        end
        if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
          return true
        end
        if buf_numbers[1] ~= buf_number then
          return true
        end
      end,
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "left",
          separator = true
        }
      },
      color_icons = true,
      show_buffer_icons = true, -- disable filetype icons for buffers
      show_buffer_close_icons = true,
      show_close_icon = true,
      show_tab_indicators = true,
      show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
      persist_buffer_sort = true,
      move_wraps_at_ends = false,
      separator_style = "thin",
      enforce_regular_tabs = true,
      always_show_bufferline = true,
      hover = {
        enabled = true,
        delay = 200,
        reveal = {'close'}
      },
      sort_by = 'id',
    }
  }
  vim.api.nvim_set_keymap('n', ']b', '<cmd>BufferLineCycleNext<CR>', {noremap=true, silent=true})
  vim.api.nvim_set_keymap('n', '[b', '<cmd>BufferLineCyclePrev<CR>', {noremap=true, silent=true})
  vim.api.nvim_set_keymap('n', '<Leader>be', '<cmd>BufferLineSortByExtension<CR>', {noremap=true, silent=true})
  vim.api.nvim_set_keymap('n', '<Leader>bd', '<cmd>BufferLineSortByDirectory<CR>', {noremap=true, silent=true})
  vim.api.nvim_set_keymap('n', '<Leader>bp', '<cmd>BufferLinePick<CR>', {noremap=true, silent=true})
  vim.api.nvim_set_keymap('n', '<Leader>bcl', '<cmd>BufferLineCloseLeft<CR>', {noremap=true, silent=true})
  vim.api.nvim_set_keymap('n', '<Leader>bcr', '<cmd>BufferLineCloseRight<CR>', {noremap=true, silent=true})
end

return M
