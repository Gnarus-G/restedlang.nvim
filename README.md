# restedlang.nvim

Rested Syntax Highlighting and LSP setup for neovim.

## Usage

### Requirements (tree-sitter-restedlang)

Downnload and ddd a treesitter parser locally. [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter/?tab=readme-ov-file#adding-parsers) has the full relevant instructions.

#### Clone [this repo](https://github.com/Gnarus-G/tree-sitter-restedlang) into `~/projects/tree-sitter-restedlang/`

```sh
mkdir ~/projects/tree-sitter-todolang
git clone https://github.com/Gnarus-G/tree-sitter-restedlang ~/projects/tree-sitter-restedlang
```

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
  on_attach = ...
  capabilities = ...
})
```

## Dev References

https://neovim.io/doc/user/lsp.html#lsp-handler  
https://github.com/David-Kunz/gen.nvim/blob/main/lua/gen/init.lua  
https://neovim.discourse.group/t/how-can-i-jump-to-the-floating-window/1034
https://github.com/neovim/nvim-lspconfig/issues/780
