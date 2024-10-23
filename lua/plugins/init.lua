return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
      },
    },
    config = function()
      require("nvim-treesitter.configs").setup {
        -- Указываем, что мы хотим использовать autotag
        autotag = {
          enable = true,
        },
        -- Включаем поддержку для нужных языков
        ensure_installed = { "html", "javascript", "typescript", "tsx", "xml" },
        highlight = {
          enable = true,
        },
      }
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    after = "nvim-treesitter", -- Этот плагин должен загружаться после treesitter
    config = function()
      require("nvim-ts-autotag").setup {
        opts = {
          -- Defaults
          enable_close = true, -- Auto close tags
          enable_rename = true, -- Auto rename pairs of tags
          enable_close_on_slash = false, -- Auto close on trailing </
        },
        -- Also override individual filetype configs, these take priority.
        -- Empty by default, useful if one of the "opts" global settings
        -- doesn't work well in a specific filetype
        per_filetype = {
          ["html"] = {
            enable_close = false,
          },
        },
      }
    end,
  },

  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
      require("lsp_signature").setup(opts)
    end,
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup {
        default_mappings = false,
        mappings = {
          i = {
            -- first_key[s]
            j = {
              --  second_key[s]
              k = "<Esc>",
              j = "<Esc>",
            },
          },
        },
      }
    end,
  },

  {
    "easymotion/vim-easymotion",
    init = function()
      vim.g.EasyMotion_smartcase = true
    end,
    keys = {
      { "<A-s>", "<plug>(easymotion-s2)", desc = "jump to char char", mode = "n" },
      -- { "<leader><leader>", "<plug>(easymotion-overwin-f)", desc = "jump to location", mode = "n" },
      -- { "<leader><leader>", "<plug>(easymotion-bd-f)", desc = "jump to location", mode = "v" },
    },
  },

  {
    "tadmccorkle/markdown.nvim",
    ft = "markdown", -- or 'event = "VeryLazy"'
    opts = {
      -- configuration here or empty for defaults
    },
  },

  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },

  {
    "stevearc/oil.nvim",
    -- opts = {},
    -- Optional dependencies
    -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    config = function()
      require("oil").setup {
        default_file_explorer = false,
        columns = { "icon", "permissions", "size", "mtime" },
        view_options = {
          show_hidden = true,
        },
        win_options = {
          cursorcolumn = false,
        },
      }
    end,
  },

  { "echasnovski/mini.nvim" },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    --     -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    --
  },

  {
    "Hoffs/omnisharp-extended-lsp.nvim",
    ft = "cs",
  },

  -- tailwind-tools.lua
  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- optional
      "neovim/nvim-lspconfig", -- optional
    },
    opts = {}, -- your configuration
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    Lazy = false,
    opts = {},
    config = function()
      require("ibl").setup {
        indent = { char = "│" },
        -- indent = { char = "·" },
      }
    end,
  },

  {
    "norcalli/nvim-colorizer.lua",
    opts = {},
  },

  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },

  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup {
        mappings = { -- Keys to be mapped to their corresponding default scrolling animation
          "<C-u>",
          "<C-d>",
          "<C-b>",
          "<C-f>",
          "<C-y>",
          "<C-e>",
          "zt",
          "zz",
          "zb",
        },
        hide_cursor = true, -- Hide cursor while scrolling
        stop_eof = true, -- Stop at <EOF> when scrolling downwards
        respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing = "linear", -- Default easing function
        pre_hook = nil, -- Function to run before the scrolling animation starts
        post_hook = nil, -- Function to run after the scrolling animation ends
        performance_mode = false, -- Disable "Performance Mode" on all buffers.
        ignored_events = { -- Events ignored while scrolling
          "WinScrolled",
          "CursorMoved",
        },
      }
    end,
  },
  {
    "ThePrimeagen/harpoon",
    config = function()
      require("harpoon").setup()
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
  },

  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      require "configs.dap-config"
    end,
  },

  {
    "nvim-neotest/nvim-nio",
  },

  {
    "3rd/image.nvim",
    config = function()
      require("image").setup {
        backend = "kitty",
        integrations = {
          markdown = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = false,
            filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
          },
          neorg = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = false,
            filetypes = { "norg" },
          },
          html = {
            enabled = false,
          },
          css = {
            enabled = false,
          },
        },
        max_width = nil,
        max_height = nil,
        max_width_window_percentage = nil,
        max_height_window_percentage = 50,
        window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
        window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
        editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
        tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
        hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
      }
    end,
  },
}
