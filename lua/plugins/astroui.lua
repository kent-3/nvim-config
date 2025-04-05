-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    colorscheme = "rose-pine",
    -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
    highlights = {
      init = { -- this table overrides highlights in all themes
        -- Normal = { bg = "#000000" },
      },
      astrodark = { -- a table of overrides/changes when applying the astrodark theme
        -- Normal = { bg = "#000000" },
      },
      habamax = { -- a table of overrides/changes when applying the habamax theme
        FloatBorder = { ctermfg = 243, ctermbg = 234, fg = "#767676", bg = "#1c1c1c" },
        WinSeparator = { ctermfg = 243, ctermbg = 234, fg = "#767676", bg = "#1c1c1c" },
        VertSplit = { ctermfg = 243, ctermbg = 234, fg = "#767676", bg = "#1c1c1c" },
        TabLine = { ctermfg = 243, ctermbg = 234, fg = "#767676", bg = "#1c1c1c" },
        TabLineSel = { bold = true, fg = "#767676", bg = "#1c1c1c" },
        TabLineFill = { ctermfg = 243, ctermbg = 234, fg = "#767676", bg = "#1c1c1c" },
        StatusLine = { ctermfg = 250, ctermbg = 236, fg = "#bcbcbc", bg = "#303030" },
      },
    },
    -- Icons can be configured throughout the interface
    icons = {
      -- configure the loading of the lsp in the status line
      LSPLoading1 = "⠋",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",
    },
  },
}
