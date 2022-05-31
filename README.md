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
