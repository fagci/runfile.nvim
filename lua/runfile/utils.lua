local M = {}

M.shell_escape = function(args)
    local ret = {}
    for _, a in pairs(args) do
        local s = tostring(a)
        if s:match("[^A-Za-z0-9_/:=-]") then
            s = "'" .. s:gsub("'", "'\\''") .. "'"
        end
        table.insert(ret, s)
    end
    return table.concat(ret, ' ')
end

M.expand_command = function(cmd, args)
    return cmd
        :gsub("{f}", vim.fn.expand('%'))
        :gsub("{r}", vim.fn.expand('%:r'))
        :gsub("{a}", args and M.shell_escape(args) or '')
end

return M
