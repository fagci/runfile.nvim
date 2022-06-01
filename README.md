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
:lua require('runfile').run()
```

With parameters

```
:lua require('runfile').run({'-f', 'value'})
```

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

## Example setup

Using packer

```lua
use {
    'fagci/runfile.nvim', 
    config = [[require('plugins.config.runfile')]]
}
```

Note: change config path (plugins.config.runfile) to yours.

### Setup mappings

```lua
local runfile = require('runfile')

runfile.setup({
    mappings = {
        ['zsh'] = 'zsh {f} {a}'
    }
})
```

### Expansions

File path parts (expanded '%')

{f} file path
{p}	full path
{h}	head (last path component removed)
{t}	tail (last path component only)
{r}	root (one extension removed)
{e}	extension only

Arguments

{a} arguments
