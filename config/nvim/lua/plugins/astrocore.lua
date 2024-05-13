return {
  "AstroNvim/astrocore",
  opts = {
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    mappings = {
      n = {
        ["<S-l>"] = {
          function() require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
          desc = "Next buffer",
        },
        ["<S-h>"] = {
          function() require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
          desc = "Previous buffer",
        },
      },
    },
  },
}
