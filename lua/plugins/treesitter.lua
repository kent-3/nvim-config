-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "bash",
      "c",
      "css",
      "dockerfile",
      "go",
      "html",
      "javascript",
      "json",
      "lua",
      "make",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "rust",
      "scss",
      "svelte",
      "toml",
      "typescript",
      "vim",
      "xml",
      "yaml",
      -- add more arguments for adding more treesitter parsers
    },
  },
}
