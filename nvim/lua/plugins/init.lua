return {
  { "rose-pine/neovim", name = "rose-pine", priority = 1000, config = function()
    require("rose-pine").setup({ variant = "main", styles = { italic = false } })
    vim.cmd("colorscheme rose-pine")
  end },

  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "vim", "typescript", "tsx", "rust", "go", "python", "json", "yaml", "markdown" },
      highlight        = { enable = true },
      indent           = { enable = true },
    })
  end },

  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" }, keys = {
    { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "find files" },
    { "<leader>fg", function() require("telescope.builtin").live_grep()  end, desc = "live grep" },
    { "<leader>fb", function() require("telescope.builtin").buffers()    end, desc = "buffers" },
  } },

  { "neovim/nvim-lspconfig", dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" }, config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({ ensure_installed = { "lua_ls", "ts_ls", "rust_analyzer" } })
    local lsp = require("lspconfig")
    lsp.lua_ls.setup({})
    lsp.ts_ls.setup({})
    lsp.rust_analyzer.setup({})
  end },

  { "stevearc/conform.nvim", opts = {
    formatters_by_ft = { lua = { "stylua" }, typescript = { "prettierd" }, rust = { "rustfmt" } },
    format_on_save   = { timeout_ms = 500, lsp_fallback = true },
  } },

  { "lewis6991/gitsigns.nvim", opts = {} },
  { "nvim-lualine/lualine.nvim", opts = { options = { theme = "rose-pine" } } },
}
