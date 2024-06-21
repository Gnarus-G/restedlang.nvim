# restedlang.nvim

Neovim Syntax Highlighting and LSP setup for [Rested](https://github.com/Gnarus-G/rested), the language.

## Usage

#### [packer.nvim](https://github.com/wbthomason/packer.nvim)

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
  on_attach = ...
  capabilities = ...
})
```

### Codelens

The language supports codelenses for running the request on the cursor's line.
Make sure a keymap set up for running codelenses, e.g:

```lua
vim.keymap.set('n', '<leader>lr', vim.lsp.codelens.run, opts)
```

## Dev References

https://neovim.io/doc/user/lsp.html#lsp-handler  
https://github.com/David-Kunz/gen.nvim/blob/main/lua/gen/init.lua  
https://neovim.discourse.group/t/how-can-i-jump-to-the-floating-window/1034
https://github.com/neovim/nvim-lspconfig/issues/780
