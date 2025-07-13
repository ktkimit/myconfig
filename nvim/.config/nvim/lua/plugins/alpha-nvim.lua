local M = {
	"goolord/alpha-nvim",
}

function M.opts()
	local alpha = require "alpha"
	local dashboard = require "alpha.themes.dashboard"
	dashboard.section.header.val = {
		[[                               __                ]],
		[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
		[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
		[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
		[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
		[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
	}
	dashboard.section.buttons.val = {
		dashboard.button("f", "  Find file", ":lua require('fzf-lua').files()<CR>"),
		dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
		-- dashboard.button("p", "  Find project", ":lua require('fzf-lua').grep_project()<CR>"),
		dashboard.button("r", "  Recently used files", ":lua require('fzf-lua').oldfiles()<CR>"),
		dashboard.button("t", "  Find text", ":lua require('fzf-lua').live_grep_glob()<CR>"),
		dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
		dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
	}
	local function footer()
		local datetime = os.date("%m-%d-%Y %H:%M:%S")
		return datetime
	end
	dashboard.section.footer.val = footer()

	dashboard.section.footer.opts.hl = "Constant"
	dashboard.section.header.opts.hl = "Include"
	dashboard.section.buttons.opts.hl = "Keyword"

	dashboard.opts.opts.noautocmd = true
	-- alpha.setup(dashboard.opts)

	vim.api.nvim_set_keymap('n', '<Leader><Leader>', '<cmd>Alpha<CR>', {noremap=true, silent=true})

  return dashboard.opts
end

return M
