# runfile.nvim

Run current opened file

## Install

Packer

```lua
use 'fagci/runfile.nvim'
```

## Usage

Simple

```
:RunFile
```

```
:lua require('runfile').run()
```

With parameters

```
:RunFile -f value
```

```
:lua require('runfile').run({'-f', 'value'})
```

## Example setup using packer

Applied over [default mappings](https://github.com/fagci/runfile.nvim/blob/main/lua/runfile/init.lua)

```lua
use {
    'fagci/runfile.nvim', 
    config = function()
        require('runfile').setup({
            mappings = {
                ['zsh'] = 'zsh {f} {a}'
            }
        })
    end
}
```

### Expansions

File path parts (expanded '%')

- {f} file path
- {p} full path
- {h} head (last path component removed)
- {t} tail (last path component only)
- {r} root (one extension removed)
- {e} extension only

Arguments

- {a} arguments

## Supported filetypes

- applescript
- elixir
- erlang
- ghci
- go
- idris
- java
- javascript
- lua
- moon
- perl
- php
- python
- ruby
- sh
