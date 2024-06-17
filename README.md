# rested.nvim

Rested Syntax Highlighting and LSP setup for neovim

## Usage

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use { 'gnarus-g/restedlang.nvim',
  requires = {
    { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" }
  },
  config = function()
    require("restedlang")
  end
}
```

Pass capabilities in your own configs.

```lua
require("lspconfig").rstdls.setup({
  capabilities = ...
})
```
