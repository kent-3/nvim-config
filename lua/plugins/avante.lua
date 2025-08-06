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
    provider = "claude",
    auto_suggestions_provider = nil,
    providers = {
      claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-3-5-sonnet-20241022",
        timeout = 60000,
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 4096,
        },
      },
      ["claude-haiku"] = {
        endpoint = "https://api.anthropic.com",
        model = "claude-3-5-haiku-20241022",
        timeout = 60000,
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 2048,
        },
      },
    },
    windows = {
      position = "right", -- "right" | "left" | "top" | "bottom"
      wrap = true,
      width = 40, -- Percentage of available width
      sidebar_header = {
        enabled = true,
        align = "center", -- "left" | "center" | "right"
        rounded = false,
      },
      -- input = {
      --   prefix = "> ",
      --   height = 8, -- Height of input window
      -- },
      ask = {
        floating = false, -- Use floating window or sidebar
        border = { " ", " ", " ", " ", " ", " ", " ", " " },
        start_insert = false,
        focus_on_apply = "ours", -- "ours" | "theirs"
      },
      -- spinner = {
      --   editing = { "⡀", "⠄", "⠂", "⠁", "⠈", "⠐", "⠠", "⢀" },
      --   generating = { "·", "✢", "✳", "∗", "✻", "✽" },
      --   thinking = { "🤯", "🙄" },
      -- },
    },
    selector = {
      provider = "telescope", -- "native" | "fzf_lua" | "telescope" | "mini_pick"
      provider_opts = {},
    },
    input = {
      provider = "snacks", -- "native" | "dressing" | "snacks"
      provider_opts = {},
    },
    suggestion = {
      debounce = 2000, -- ms to wait before triggering
      throttle = 2000, -- ms between requests
    },
  },
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
}
