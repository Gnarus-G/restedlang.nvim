-- Treesitter
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.restedlang = {
  install_info = {
    url = "https://github.com/Gnarus-G/tree-sitter-restedlang", -- local path or git repo
    files = { "src/parser.c" },                                 -- note that some parsers also require src/scanner.c or src/scanner.cc
    -- optional entries:
    branch = "main",                                            -- default branch in case of git repo if different from master
    generate_requires_npm = false,                              -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false,                     -- if folder contains pre-generated src/parser.c
  },
}

vim.filetype.add({
  extension = {
    rstd = "restedlang",
    rd = "restedlang"
  }
})

-- LSP setup
local nvim_lsp = require("lspconfig");
local configs = require 'lspconfig.configs'

if not configs.rstdls then
  configs.rstdls = {
    ---@type lspconfig.Config
    default_config = {
      cmd = { "rstd", "lsp" },
      single_file_support = true,
      root_dir = nvim_lsp.util.root_pattern(".env.rd.json"),
      filetypes = { "restedlang" },
    },
  }
end

require "restedlang.command_handler".setup()
