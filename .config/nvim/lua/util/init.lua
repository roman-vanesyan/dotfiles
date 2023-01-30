local M = {}

M.map = function(modes, lhs, rhs, opts)
        local options = { noremap = true }
        if opts then
            options = vim.tbl_extend('force', options, opts)
        end
        
        if type(modes) == 'string' then
                modes = { modes }
        end

        for _, mode in ipairs(modes) do
            vim.api.nvim_set_keymap(mode, lhs, rhs, options)
        end
end

return M
