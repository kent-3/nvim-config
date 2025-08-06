---@type LazySpec
return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false, -- Never set this to "*"!
  -- Build command - use powershell on Windows, make on Unix
  build = vim.fn.has "win32" ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    or "make",
  ---@module 'avante'
  ---@type avante.Config
  opts = {
    -- ═══════════════════════════════════════════════════════════
    -- PROVIDER CONFIGURATION - Multiple Claude models for different tasks
    -- ═══════════════════════════════════════════════════════════
    provider = "claude-haiku", -- Main provider for complex reasoning
    auto_suggestions_provider = nil,

    providers = {
      -- Claude 3.5 Sonnet - Best balance of speed and intelligence
      ["claude-sonnet"] = {
        __inherited_from = "claude",
        endpoint = "https://api.anthropic.com",
        model = "claude-3-5-sonnet-20241022",
        timeout = 30000,
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 4096,
        },
      },

      -- Claude 3.5 Haiku - Fastest Claude model for quick tasks
      ["claude-haiku"] = {
        __inherited_from = "claude",
        endpoint = "https://api.anthropic.com",
        model = "claude-3-5-haiku-20241022",
        -- timeout = 15000,
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 2048,
        },
      },

      -- Claude 4.1 Opus - Highest intelligence for complex reasoning
      -- ["claude-opus"] = {
      --   endpoint = "https://api.anthropic.com",
      --   model = "claude-opus-4-1-20250805",
      --   timeout = 120000, -- Longer timeout for complex tasks
      --   extra_request_body = {
      --     temperature = 0.8, -- Higher creativity for complex problems
      --     max_tokens = 8192, -- More tokens for detailed responses
      --   },
      -- },

      -- Claude Sonnet 4 - Latest model (if available)
      ["claude-sonnet-4"] = {
        __inherited_from = "claude",
        endpoint = "https://api.anthropic.com",
        model = "claude-sonnet-4-20250514",
        timeout = 60000,
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 6144,
        },
      },
    },

    -- ═══════════════════════════════════════════════════════════
    -- DUAL BOOST MODE - Combine multiple Claude models
    -- ═══════════════════════════════════════════════════════════
    -- dual_boost = {
    --   enabled = false, -- Set to true to enable
    --   first_provider = "claude-haiku", -- Fast first response
    --   second_provider = "claude-sonnet", -- Balanced second response
    --   prompt = "Based on the two Claude responses below, generate a final response that combines the best insights from both. Focus on accuracy and completeness. Reference Output 1: [{{provider1_output}}], Reference Output 2: [{{provider2_output}}]",
    --   timeout = 90000,
    -- },

    -- ═══════════════════════════════════════════════════════════
    -- BEHAVIOR SETTINGS
    -- ═══════════════════════════════════════════════════════════
    -- behaviour = {
    --   auto_suggestions = false, -- Enable/disable auto suggestions (experimental)
    --   auto_set_highlight_group = true,
    --   auto_set_keymaps = true,
    --   auto_apply_diff_after_generation = false,
    --   support_paste_from_clipboard = false,
    --   minimize_diff = true,
    --   enable_token_counting = true,
    -- },

    -- ═══════════════════════════════════════════════════════════
    -- WINDOW/INTERFACE CONFIGURATION
    -- ═══════════════════════════════════════════════════════════
    windows = {
      position = "right", -- "right" | "left" | "top" | "bottom"
      wrap = true,
      width = 40, -- Percentage of available width

      sidebar_header = {
        enabled = true,
        align = "center", -- "left" | "center" | "right"
        rounded = false,
      },

      -- Input area configuration
      -- input = {
      --   prefix = "> ",
      --   height = 8, -- Height of input window
      -- },

      -- Edit window configuration
      -- edit = {
      --   border = "rounded",
      --   start_insert = true, -- Start in insert mode
      -- },

      -- Ask window configuration
      ask = {
        floating = false, -- Use floating window or sidebar
        border = { " ", " ", " ", " ", " ", " ", " ", " " },
        start_insert = false,
        focus_on_apply = "ours", -- "ours" | "theirs"
      },

      -- Spinner animations for different states
      -- spinner = {
      --   editing = { "⡀", "⠄", "⠂", "⠁", "⠈", "⠐", "⠠", "⢀" },
      --   generating = { "·", "✢", "✳", "∗", "✻", "✽" },
      --   thinking = { "🤯", "🙄" },
      -- },
    },

    -- ═══════════════════════════════════════════════════════════
    -- KEYBINDING CONFIGURATION
    -- ═══════════════════════════════════════════════════════════
    -- mappings = {
    --   -- Diff mappings
    --   diff = {
    --     ours = "co",
    --     theirs = "ct",
    --     all_theirs = "ca",
    --     both = "cb",
    --     cursor = "cc",
    --     next = "]x",
    --     prev = "[x",
    --   },
    --
    --   -- Inline suggestion mappings
    --   suggestion = {
    --     accept = "<M-l>",
    --     next = "<M-]>",
    --     prev = "<M-[>",
    --     dismiss = "<C-]>",
    --   },
    --
    --   -- Sidebar mappings
    --   sidebar = {
    --     apply_all = "A",
    --     apply_cursor = "a",
    --     retry_user_request = "r",
    --     edit_user_request = "e",
    --     switch_windows = "<Tab>",
    --     reverse_switch_windows = "<S-Tab>",
    --     remove_file = "d",
    --     add_file = "@",
    --     close = { "<Esc>", "q" },
    --   },
    --
    --   -- Submit mappings
    --   submit = {
    --     normal = "<CR>",
    --     insert = "<C-s>",
    --   },
    -- },

    -- ═══════════════════════════════════════════════════════════
    -- SELECTOR CONFIGURATION (for file picker)
    -- ═══════════════════════════════════════════════════════════
    selector = {
      provider = "telescope", -- "native" | "fzf_lua" | "telescope" | "mini_pick"
      provider_opts = {},
    },

    -- ═══════════════════════════════════════════════════════════
    -- INPUT PROVIDER (for API key entry, etc.)
    -- ═══════════════════════════════════════════════════════════
    input = {
      provider = "snacks", -- "native" | "dressing" | "snacks"
      -- provider_opts = {},
    },

    -- ═══════════════════════════════════════════════════════════
    -- HINTS AND HIGHLIGHTS
    -- ═══════════════════════════════════════════════════════════
    -- hints = { enabled = true },
    --
    -- highlights = {
    --   diff = {
    --     current = "DiffText",
    --     incoming = "DiffAdd",
    --   },
    -- },

    -- ═══════════════════════════════════════════════════════════
    -- SUGGESTION TIMING
    -- ═══════════════════════════════════════════════════════════
    suggestion = {
      debounce = 2000, -- ms to wait before triggering
      throttle = 2000, -- ms between requests
    },
  },

  -- ═══════════════════════════════════════════════════════════
  -- DEPENDENCIES
  -- ═══════════════════════════════════════════════════════════
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "echasnovski/mini.pick", -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "stevearc/dressing.nvim", -- for input provider dressing
    "folke/snacks.nvim", -- for input provider snacks
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },

  -- ═══════════════════════════════════════════════════════════
  -- KEYBINDINGS FOR SWITCHING BETWEEN CLAUDE MODELS
  -- ═══════════════════════════════════════════════════════════
  -- keys = {
  --   {
  --     "<leader>aa",
  --     function() require("avante.api").ask() end,
  --     desc = "avante: ask",
  --     mode = { "n", "v" },
  --   },
  --   {
  --     "<leader>ar",
  --     function() require("avante.api").refresh() end,
  --     desc = "avante: refresh",
  --   },
  --   {
  --     "<leader>ae",
  --     function() require("avante.api").edit() end,
  --     desc = "avante: edit",
  --     mode = "v",
  --   },
  --   {
  --     "<leader>a?",
  --     "<cmd>AvanteSwitchProvider<cr>",
  --     desc = "avante: switch Claude model",
  --   },
  --   -- Quick switches to specific Claude models
  --   {
  --     "<leader>ah",
  --     function()
  --       require("avante.config").override { provider = "claude-haiku" }
  --       print "Switched to Claude Haiku (fast)"
  --     end,
  --     desc = "avante: switch to Claude Haiku (fast)",
  --   },
  --   {
  --     "<leader>as",
  --     function()
  --       require("avante.config").override { provider = "claude-sonnet" }
  --       print "Switched to Claude Sonnet (balanced)"
  --     end,
  --     desc = "avante: switch to Claude Sonnet (balanced)",
  --   },
  --   {
  --     "<leader>ao",
  --     function()
  --       require("avante.config").override { provider = "claude-opus" }
  --       print "Switched to Claude Opus (powerful)"
  --     end,
  --     desc = "avante: switch to Claude Opus (powerful)",
  --   },
  -- },
}
