return {
    '2kabhishek/markit.nvim',
    dependencies = {
        { '2kabhishek/pickme.nvim', opts = { picker = 'fzf-lua' } },
        'nvim-lua/plenary.nvim',
    },
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {},
    config = function(_, opts)
        require('markit').setup(opts)

        local markit = require('markit')
        local picker = require('markit.picker')
        local pickme = require('pickme')

        local function delete_mark(e)
            if e and e.mark and e.bufnr and vim.api.nvim_buf_is_valid(e.bufnr) then
                vim.api.nvim_buf_call(e.bufnr, function()
                    markit.mark_state:delete_mark(e.mark, true)
                end)
            end
        end

        local function delete_bookmark(e)
            local bm = markit.bookmark_state
            local g = e and e.group ~= nil and bm.groups[e.group]
            if not g or not g.marks[e.bufnr] then return end
            for key, m in pairs(g.marks[e.bufnr]) do
                local pos = vim.api.nvim_buf_get_extmark_by_id(e.bufnr, g.ns, m.extmark_id, {})
                if pos and pos[1] + 1 == e.lnum then
                    bm:delete_mark(e.group, e.bufnr, key)
                    return
                end
            end
        end

        -- Patch pickme.custom_picker once; each wrapped picker sets
        -- `pending` so the next call gets a <C-d> delete action injected.
        local pending
        local orig_picker = pickme.custom_picker
        pickme.custom_picker = function(o)
            if pending then
                local p = pending; pending = nil
                o.action_map = vim.tbl_extend('force', o.action_map or {}, {
                    ['<C-d>'] = function(_, sel)
                        if sel and sel.value then
                            p.del(sel.value)
                            vim.schedule(p.reopen)
                        end
                    end,
                })
            end
            return orig_picker(o)
        end

        local function wrap(fn, del)
            local function w(...)
                local args = { ... }
                pending = { del = del, reopen = function() w(unpack(args)) end }
                fn(...)
                vim.defer_fn(function() pending = nil end, 50)
            end
            return w
        end

        for _, name in ipairs({ 'marks_list_buf', 'marks_list_all', 'marks_list_global', 'marks_list_project' }) do
            picker[name] = wrap(picker[name], delete_mark)
        end
        for _, name in ipairs({ 'bookmarks_list_all', 'bookmarks_list_buffer', 'bookmarks_list_project', 'bookmarks_list_group' }) do
            picker[name] = wrap(picker[name], delete_bookmark)
        end
    end,
}
