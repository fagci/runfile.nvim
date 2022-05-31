local M = {}

local function shell_escape(args)
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

local function expand_command(cmd, args)
    return cmd
        :gsub("{f}", vim.fn.expand('%'))
        :gsub("{r}", vim.fn.expand('%:r'))
        :gsub("{a}", args and shell_escape(args) or '')
end

-- Run opened file in shell with args
M.run = function(...)
    local mappings = {
        ['applescript'] = 'osascript {f} {a}',
        ['elixir'] = 'elixir {f} {a}',
        ['erlang'] = 'escript {f} {a}',
        ['ghci'] = 'ghci {f} {a}',
        ['go'] = 'go run {f} {a}',
        ['idris'] = 'idris {f} {a}',
        ['java'] = 'javac -g:none {f} && java {r}',
        ['javascript'] = 'node {f} {a}',
        ['lua'] = 'lua {f} {a}',
        ['moon'] = 'moon {f} {a}',
        ['perl'] = 'perl {f} {a}',
        ['php'] = 'php {f} {a}',
        ['python'] = 'python {f} {a}',
        ['ruby'] = 'ruby {f} {a}',
        ['sh'] = 'sh {f} {a}',
    }

    local ft = vim.bo.filetype

    local cmd = mappings[ft]
    if not cmd then
        print('No support for ' .. ft)
        return
    end

    local command = expand_command(cmd, ...)

    print('Running: ' .. command)
    vim.cmd('term ' .. command)
    vim.cmd('startinsert')
end

return M
