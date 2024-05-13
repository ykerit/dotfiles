if not vim.g.vscode then return {} end

local enabled = {}
vim.tbl_map(function(plugin) enabled[plugin] = true end, {
  "lazy.nvim",
  "AstroNvim",
  "astrocore",
  "astroui",
  "Comment.nvim",
  "nvim-autopairs",
  "nvim-treesitter",
  "nvim-ts-autotag",
  "nvim-treesitter-textobjects",
  "nvim-ts-context-commentstring",
  "better-escape.nvim",
})

local Config = require "lazy.core.config"
-- disable plugin update checking
Config.options.checker.enabled = false
Config.options.change_detection.enabled = false
-- replace the default `cond`
Config.options.defaults.cond = function(plugin) return enabled[plugin.name] end

return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<Leader>ff"] = "<Cmd>Find<CR>",
          ["<Leader>fw"] = "<Cmd>call VSCodeNotify('workbench.action.findInFiles')<CR>",
          ["<Leader>ls"] = "<Cmd>call VSCodeNotify('workbench.action.gotoSymbol')<CR>",
          ["<Leader>c"] = "<Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>",
        },
      },
    },
  },
  { "AstroNvim/astroui", opts = { colorscheme = false } },
  { "nvim-treesitter/nvim-treesitter", opts = { highlight = { enable = false } } },
}
