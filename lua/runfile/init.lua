local M = {}
local utils = require('runfile.utils')

M.default_mappings = {
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
    ['sh'] = '{f} {a}',
}

M.mappings = {}
M._is_setup_runned = false

-- Setup some options, for example: { mappings = { ['sh'] = 'zsh {f} {a}' } }
M.setup = function(options)
    M._is_setup_runned = true
    M.mappings = vim.tbl_deep_extend(
        'force',
        M.default_mappings,
        options.mappings or {}
    )
end

-- Run opened file in shell with args
M.run = function(...)
    local ft = vim.bo.filetype

    if not M._is_setup_runned then
        print('[runfile.nvim] Setup not called, using default options')
        M.setup({})
    end

    if ft == '' then
        print('[runfile.nvim] No filetype detected by nvim')
        return
    end

    local cmd = M.mappings[ft]
    if not cmd then
        print('[runfile.nvim] No support for ' .. ft)
        return
    end

    local command = utils.expand_command(cmd, ...)

    print('Running: ' .. command)
    vim.cmd('term ' .. command)
    vim.cmd('startinsert')
end

return M
