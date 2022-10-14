local status_ok, zk = pcall(require, "zk")
if not status_ok then
	return
end

local commands = require("zk.commands")

local function make_edit_fn(defaults, picker_options)
  return function(options)
    options = vim.tbl_extend("force", defaults, options or {})
    zk.edit(options, picker_options)
  end
end

commands.add("ZkOrphans", make_edit_fn({ orphan = true }, { title = "Zk Orphans" }))
commands.add("ZkRecents", make_edit_fn({ createdAfter = "2 weeks ago" }, { title = "Zk Recents" }))

zk.setup({
  picker = "telescope",
})

local opts = { noremap=true, silent=false }

-- Create a new note after asking for its title.
-- vim.api.nvim_set_keymap("n", "<leader>zn", "<Cmd>ZkNew { dir=vim.fn.input('Dir: '), title = vim.fn.input('Title: ') }<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>zn", "<Cmd>ZkNew { dir=vim.env.ZK_NOTEBOOK_DIR..'/wiki', title = vim.fn.input('Title: ') }<CR>", opts)
-- Create a daily note
vim.api.nvim_set_keymap("n", "<leader>zd", "<Cmd>ZkNew { dir=vim.env.ZK_NOTEBOOK_DIR..'/daily' }<CR>", opts)

-- Open notes.
vim.api.nvim_set_keymap("n", "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", opts)
-- Open notes associated with the selected tags.
vim.api.nvim_set_keymap("n", "<leader>zt", "<Cmd>ZkTags<CR>", opts)

-- Search for the notes matching a given query.
vim.api.nvim_set_keymap("n", "<leader>zf", "<Cmd>ZkNotes { sort = { 'modified' }, match = vim.fn.input('Search: ') }<CR>", opts)
-- Search for the notes matching the current visual selection.
vim.api.nvim_set_keymap("v", "<leader>zf", ":'<,'>ZkMatch<CR>", opts)

