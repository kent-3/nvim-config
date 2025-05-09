-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

parser_config.noir = {
  install_info = {
    url = "https://github.com/hhamud/tree-sitter-noir", -- the url for this tree-sitter grammar
    files = { "src/parser.c", "src/scanner.c" },
    branch = "main",
  },
  filetype = "noir", -- if filetype does not agrees with parser name you can define this field
}

require("nvim-treesitter.configs").setup {
  ensure_installed = "noir", -- The custom parser
  highlight = {
    enable = true, -- false will disable the whole extension
  },
}
